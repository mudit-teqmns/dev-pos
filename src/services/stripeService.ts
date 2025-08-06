import { loadStripe } from '@stripe/stripe-js'
import { supabase } from '../lib/supabase'

export interface StripeCustomer {
  id: string
  email: string
  name: string
  created: number
}

export interface StripeSubscription {
  id: string
  status: string
  current_period_start: number
  current_period_end: number
  customer: string
  items: {
    data: Array<{
      price: {
        id: string
        unit_amount: number
        currency: string
      }
    }>
  }
}

export interface PaymentIntent {
  id: string
  client_secret: string
  status: string
  amount: number
  currency: string
}

export class StripeService {
  private static baseUrl = `${import.meta.env.VITE_SUPABASE_URL}/functions/v1`
  private static headers = {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${import.meta.env.VITE_SUPABASE_ANON_KEY}`,
  }

  static async createPaymentIntent(data: {
    amount: number
    currency?: string
    subscription_plan: string
    customer_email: string
    customer_name: string
    metadata?: Record<string, string>
  }): Promise<{
    client_secret: string
    customer_id: string
    payment_intent_id: string
  }> {
    const response = await fetch(`${this.baseUrl}/create-payment-intent`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify({
        currency: 'usd',
        ...data
      }),
    })

    const result = await response.json()

    if (!response.ok) {
      throw new Error(result.error || 'Failed to create payment intent')
    }

    return result
  }

  static async createSubscription(data: {
    customer_id: string
    price_id: string
    payment_method_id: string
    subscription_plan: string
    kitchen_owner_data: {
      email: string
      full_name: string
      phone_number?: string
    }
  }): Promise<{
    subscription_id: string
    status: string
    client_secret?: string
    kitchen_owner_id: string
    credentials: {
      email: string
      password: string
    }
  }> {
    const response = await fetch(`${this.baseUrl}/create-subscription`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify(data),
    })

    const result = await response.json()

    if (!response.ok) {
      throw new Error(result.error || 'Failed to create subscription')
    }

    return result
  }

  static async cancelSubscription(subscriptionId: string): Promise<void> {
    const response = await fetch(`${this.baseUrl}/cancel-subscription`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify({ subscription_id: subscriptionId }),
    })

    if (!response.ok) {
      const result = await response.json()
      throw new Error(result.error || 'Failed to cancel subscription')
    }
  }

  static async updateSubscription(subscriptionId: string, newPriceId: string): Promise<void> {
    const response = await fetch(`${this.baseUrl}/update-subscription`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify({ 
        subscription_id: subscriptionId,
        new_price_id: newPriceId 
      }),
    })

    if (!response.ok) {
      const result = await response.json()
      throw new Error(result.error || 'Failed to update subscription')
    }
  }

  static async getCustomerPortalUrl(customerId: string): Promise<string> {
    const response = await fetch(`${this.baseUrl}/create-portal-session`, {
      method: 'POST',
      headers: this.headers,
      body: JSON.stringify({ customer_id: customerId }),
    })

    const result = await response.json()

    if (!response.ok) {
      throw new Error(result.error || 'Failed to create portal session')
    }

    return result.url
  }

  static async validateWebhook(payload: string, signature: string): Promise<any> {
    const response = await fetch(`${this.baseUrl}/webhook-stripe`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'stripe-signature': signature,
      },
      body: payload,
    })

    if (!response.ok) {
      throw new Error('Webhook validation failed')
    }

    return response.json()
  }

  static isStripeConfigured(): boolean {
    return !!(import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY)
  }

  static getStripePublishableKey(): string | null {
    return import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY || null
  }
}