import { loadStripe } from '@stripe/stripe-js'

// Initialize Stripe
const stripePublishableKey = import.meta.env.VITE_STRIPE_PUBLISHABLE_KEY

if (!stripePublishableKey) {
  console.warn('Stripe publishable key not found. Payment features will be disabled.')
}

export const stripePromise = stripePublishableKey 
  ? loadStripe(stripePublishableKey)
  : Promise.resolve(null)

// Subscription plans
export const SUBSCRIPTION_PLANS = {
  basic: {
    id: 'basic',
    name: 'Basic Plan',
    price: 2999, // $29.99 in cents
    priceId: import.meta.env.VITE_STRIPE_BASIC_PRICE_ID || 'price_basic_monthly',
    features: [
      'Up to 100 orders per month',
      'Basic menu management',
      'Email support',
      'Single location'
    ]
  },
  premium: {
    id: 'premium',
    name: 'Premium Plan',
    price: 4999, // $49.99 in cents
    priceId: import.meta.env.VITE_STRIPE_PREMIUM_PRICE_ID || 'price_premium_monthly',
    features: [
      'Up to 500 orders per month',
      'Advanced menu management',
      'Priority support',
      'Multiple locations',
      'Analytics dashboard'
    ]
  },
  enterprise: {
    id: 'enterprise',
    name: 'Enterprise Plan',
    price: 9999, // $99.99 in cents
    priceId: import.meta.env.VITE_STRIPE_ENTERPRISE_PRICE_ID || 'price_enterprise_monthly',
    features: [
      'Unlimited orders',
      'Full feature access',
      '24/7 phone support',
      'Custom integrations',
      'Advanced analytics',
      'White-label options'
    ]
  }
} as const

export type SubscriptionPlan = keyof typeof SUBSCRIPTION_PLANS

// Format price for display
export const formatPrice = (cents: number): string => {
  return new Intl.NumberFormat('en-US', {
    style: 'currency',
    currency: 'USD',
  }).format(cents / 100)
}