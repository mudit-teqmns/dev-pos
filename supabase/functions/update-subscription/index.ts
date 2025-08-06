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

interface UpdateSubscriptionRequest {
  subscription_id: string
  new_price_id: string
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

    const { subscription_id, new_price_id }: UpdateSubscriptionRequest = await req.json()

    if (!subscription_id || !new_price_id) {
      return new Response(
        JSON.stringify({ error: 'Missing required fields' }),
        {
          status: 400,
          headers: { ...corsHeaders, 'Content-Type': 'application/json' },
        }
      )
    }

    // Get current subscription
    const subscription = await stripe.subscriptions.retrieve(subscription_id)

    // Update subscription with new price
    const updatedSubscription = await stripe.subscriptions.update(subscription_id, {
      items: [{
        id: subscription.items.data[0].id,
        price: new_price_id,
      }],
      proration_behavior: 'create_prorations',
    })

    // Get the new price to update the amount in database
    const newPrice = await stripe.prices.retrieve(new_price_id)
    
    // Determine the new plan based on price ID
    let newPlan = 'basic'
    if (new_price_id.includes('premium')) newPlan = 'premium'
    if (new_price_id.includes('enterprise')) newPlan = 'enterprise'

    // Update kitchen owner record
    const { error: updateError } = await supabase
      .from('kitchen_owners')
      .update({
        subscription_plan: newPlan,
        subscription_amount: newPrice.unit_amount! / 100,
        subscription_expires_at: new Date(updatedSubscription.current_period_end * 1000).toISOString(),
      })
      .eq('payment_id', subscription_id)

    if (updateError) {
      console.error('Error updating kitchen owner record:', updateError)
    }

    return new Response(
      JSON.stringify({
        success: true,
        message: 'Subscription updated successfully',
        subscription: {
          id: updatedSubscription.id,
          status: updatedSubscription.status,
          current_period_end: updatedSubscription.current_period_end,
          plan: newPlan,
          amount: newPrice.unit_amount! / 100
        }
      }),
      {
        status: 200,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )

  } catch (error) {
    console.error('Error updating subscription:', error)
    return new Response(
      JSON.stringify({ 
        error: 'Failed to update subscription',
        details: error instanceof Error ? error.message : 'Unknown error'
      }),
      {
        status: 500,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )
  }
})