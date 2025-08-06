import { createClient } from 'npm:@supabase/supabase-js@2.39.3'
import Stripe from 'npm:stripe@14.21.0'
import { corsHeaders } from '../_shared/cors.ts'

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY') ?? '', {
  apiVersion: '2023-10-16',
})

interface CreatePortalSessionRequest {
  customer_id: string
  return_url?: string
}

Deno.serve(async (req: Request) => {
  if (req.method === 'OPTIONS') {
    return new Response(null, {
      status: 200,
      headers: corsHeaders,
    })
  }

  try {
    if (req.method !== 'POST') {
      return new Response(
        JSON.stringify({ error: 'Method not allowed' }),
        {
          status: 405,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      )
    }

    const { customer_id, return_url }: CreatePortalSessionRequest = await req.json()

    if (!customer_id) {
      return new Response(
        JSON.stringify({ error: 'Missing customer_id' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      )
    }

    // Create portal session
    const portalSession = await stripe.billingPortal.sessions.create({
      customer: customer_id,
      return_url: return_url || `${req.headers.get('origin') || 'http://localhost:5173'}/dashboard`,
    })

    return new Response(
      JSON.stringify({
        url: portalSession.url
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )

  } catch (error) {
    console.error('Error creating portal session:', error)
    return new Response(
      JSON.stringify({ 
        error: 'Failed to create portal session',
        details: error instanceof Error ? error.message : 'Unknown error'
      }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )
  }
})