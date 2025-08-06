import { createClient } from 'npm:@supabase/supabase-js@2.39.3'
import Stripe from 'npm:stripe@14.21.0'
import { corsHeaders } from '../_shared/cors.ts'

const stripe = new Stripe(Deno.env.get('STRIPE_SECRET_KEY') ?? '', {
  apiVersion: '2023-10-16',
})

const supabase = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? ''
)

interface CancelSubscriptionRequest {
  subscription_id: string
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

    const { subscription_id }: CancelSubscriptionRequest = await req.json()

    if (!subscription_id) {
      return new Response(
        JSON.stringify({ error: 'Missing subscription_id' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      )
    }

    // Cancel subscription in Stripe
    const cancelledSubscription = await stripe.subscriptions.cancel(subscription_id)

    // Update kitchen owner record
    const { error: updateError } = await supabase
      .from('kitchen_owners')
      .update({
        subscription_expires_at: new Date(cancelledSubscription.canceled_at! * 1000).toISOString(),
      })
      .eq('payment_id', subscription_id)

    if (updateError) {
      console.error('Error updating kitchen owner record:', updateError)
    }

    // Update restaurant status to inactive
    const { error: restaurantError } = await supabase
      .from('restaurants')
      .update({ status: 'inactive' })
      .eq('owner_id', (await supabase
        .from('kitchen_owners')
        .select('id')
        .eq('payment_id', subscription_id)
        .single()
      ).data?.id)

    if (restaurantError) {
      console.error('Error updating restaurant status:', restaurantError)
    }

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Subscription cancelled successfully',
        cancelled_at: cancelledSubscription.canceled_at
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )

  } catch (error) {
    console.error('Error cancelling subscription:', error)
    return new Response(
      JSON.stringify({ 
        error: 'Failed to cancel subscription',
        details: error instanceof Error ? error.message : 'Unknown error'
      }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )
  }
})