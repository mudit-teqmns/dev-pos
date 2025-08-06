import React, { useState, useEffect } from 'react'
import { useAuth } from '../contexts/AuthContext'
import { SubscriptionService, type SubscriptionInfo } from '../services/subscriptionService'
import { StripeService } from '../services/stripeService'
import { SUBSCRIPTION_PLANS, formatPrice, type SubscriptionPlan } from '../lib/stripe'
import { 
  CreditCard, 
  Calendar, 
  AlertTriangle, 
  CheckCircle, 
  ExternalLink,
  Crown,
  Zap,
  Shield
} from 'lucide-react'
import LoadingSpinner from './LoadingSpinner'
import toast from 'react-hot-toast'
import { format } from 'date-fns'

interface SubscriptionManagementProps {
  className?: string
}

export default function SubscriptionManagement({ className = '' }: SubscriptionManagementProps) {
  const { user } = useAuth()
  const [subscription, setSubscription] = useState<SubscriptionInfo | null>(null)
  const [loading, setLoading] = useState(true)
  const [actionLoading, setActionLoading] = useState<string | null>(null)

  useEffect(() => {
    if (user?.role === 'kitchen_owner') {
      fetchSubscription()
    }
  }, [user])

  const fetchSubscription = async () => {
    try {
      setLoading(true)

      // Get kitchen owner ID
      const { data: kitchenOwner } = await supabase
        .from('kitchen_owners')
        .select('id')
        .eq('user_id', user?.id)
        .single()

      if (kitchenOwner) {
        const subscriptionData = await SubscriptionService.getCurrentSubscription(kitchenOwner.id)
        setSubscription(subscriptionData)
      }
    } catch (error) {
      console.error('Error fetching subscription:', error)
      toast.error('Failed to load subscription information')
    } finally {
      setLoading(false)
    }
  }

  const handleCancelSubscription = async () => {
    if (!subscription || !confirm('Are you sure you want to cancel your subscription? This action cannot be undone.')) {
      return
    }

    try {
      setActionLoading('cancel')
      await StripeService.cancelSubscription(subscription.id)
      toast.success('Subscription cancelled successfully')
      await fetchSubscription()
    } catch (error) {
      console.error('Error cancelling subscription:', error)
      toast.error('Failed to cancel subscription')
    } finally {
      setActionLoading(null)
    }
  }

  const handleUpgradeSubscription = async (newPlan: SubscriptionPlan) => {
    if (!subscription) return

    try {
      setActionLoading('upgrade')
      const newPriceId = SUBSCRIPTION_PLANS[newPlan].priceId
      await StripeService.updateSubscription(subscription.id, newPriceId)
      toast.success('Subscription updated successfully')
      await fetchSubscription()
    } catch (error) {
      console.error('Error updating subscription:', error)
      toast.error('Failed to update subscription')
    } finally {
      setActionLoading(null)
    }
  }

  const handleManageBilling = async () => {
    if (!subscription) return

    try {
      setActionLoading('portal')
      
      // Get customer ID from kitchen owner
      const { data: kitchenOwner } = await supabase
        .from('kitchen_owners')
        .select('payment_id')
        .eq('user_id', user?.id)
        .single()

      if (kitchenOwner?.payment_id) {
        const portalUrl = await StripeService.getCustomerPortalUrl(kitchenOwner.payment_id)
        window.open(portalUrl, '_blank')
      }
    } catch (error) {
      console.error('Error opening customer portal:', error)
      toast.error('Failed to open billing portal')
    } finally {
      setActionLoading(null)
    }
  }

  const getPlanIcon = (plan: string) => {
    switch (plan) {
      case 'basic':
        return <Shield className="h-5 w-5 text-blue-600" />
      case 'premium':
        return <Zap className="h-5 w-5 text-purple-600" />
      case 'enterprise':
        return <Crown className="h-5 w-5 text-yellow-600" />
      default:
        return <CreditCard className="h-5 w-5 text-gray-600" />
    }
  }

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'active':
        return 'text-success-600 bg-success-100'
      case 'past_due':
        return 'text-warning-600 bg-warning-100'
      case 'cancelled':
      case 'inactive':
        return 'text-error-600 bg-error-100'
      default:
        return 'text-gray-600 bg-gray-100'
    }
  }

  const isExpiringSoon = subscription 
    ? new Date(subscription.current_period_end) < new Date(Date.now() + 7 * 24 * 60 * 60 * 1000)
    : false

  if (loading) {
    return (
      <div className={`card ${className}`}>
        <div className="card-content">
          <div className="flex items-center justify-center py-8">
            <LoadingSpinner size="md" />
          </div>
        </div>
      </div>
    )
  }

  if (!StripeService.isStripeConfigured()) {
    return (
      <div className={`card border-warning-200 ${className}`}>
        <div className="card-content">
          <div className="flex items-center gap-3">
            <AlertTriangle className="h-6 w-6 text-warning-600" />
            <div>
              <h3 className="font-semibold text-warning-800">Stripe Not Configured</h3>
              <p className="text-sm text-warning-700">
                Please configure your Stripe keys to enable subscription management.
              </p>
            </div>
          </div>
        </div>
      </div>
    )
  }

  if (!subscription) {
    return (
      <div className={`card border-error-200 ${className}`}>
        <div className="card-content">
          <div className="flex items-center gap-3">
            <AlertTriangle className="h-6 w-6 text-error-600" />
            <div>
              <h3 className="font-semibold text-error-800">No Active Subscription</h3>
              <p className="text-sm text-error-700">
                Please contact support to activate your subscription.
              </p>
            </div>
          </div>
        </div>
      </div>
    )
  }

  const currentPlan = SUBSCRIPTION_PLANS[subscription.plan]

  return (
    <div className={`space-y-6 ${className}`}>
      {/* Current Subscription */}
      <div className="card">
        <div className="card-header">
          <div className="flex items-center justify-between">
            <h3 className="text-lg font-semibold text-gray-900">Current Subscription</h3>
            <span className={`badge ${getStatusColor(subscription.status)} capitalize`}>
              {subscription.status}
            </span>
          </div>
        </div>
        <div className="card-content">
          <div className="flex items-start justify-between">
            <div className="flex items-center gap-4">
              {getPlanIcon(subscription.plan)}
              <div>
                <h4 className="text-xl font-bold text-gray-900">{currentPlan.name}</h4>
                <p className="text-2xl font-bold text-primary-600">
                  {formatPrice(subscription.amount * 100)}/month
                </p>
                <div className="flex items-center gap-2 mt-2 text-sm text-gray-600">
                  <Calendar className="h-4 w-4" />
                  <span>
                    Next billing: {format(new Date(subscription.current_period_end), 'MMM dd, yyyy')}
                  </span>
                  {isExpiringSoon && (
                    <span className="text-warning-600 font-medium">(Expires soon)</span>
                  )}
                </div>
              </div>
            </div>

            <div className="flex gap-2">
              <button
                onClick={handleManageBilling}
                disabled={actionLoading === 'portal'}
                className="btn-secondary btn-sm"
              >
                {actionLoading === 'portal' ? (
                  <LoadingSpinner size="sm" />
                ) : (
                  <>
                    <ExternalLink className="h-4 w-4 mr-1" />
                    Manage Billing
                  </>
                )}
              </button>
              
              {subscription.status === 'active' && (
                <button
                  onClick={handleCancelSubscription}
                  disabled={actionLoading === 'cancel'}
                  className="btn-danger btn-sm"
                >
                  {actionLoading === 'cancel' ? (
                    <LoadingSpinner size="sm" />
                  ) : (
                    'Cancel Subscription'
                  )}
                </button>
              )}
            </div>
          </div>

          {/* Current Plan Features */}
          <div className="mt-6 pt-6 border-t border-gray-200">
            <h5 className="font-medium text-gray-900 mb-3">Current Plan Features</h5>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-2">
              {currentPlan.features.map((feature, index) => (
                <div key={index} className="flex items-center gap-2 text-sm text-gray-700">
                  <CheckCircle className="h-4 w-4 text-success-600" />
                  <span>{feature}</span>
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>

      {/* Upgrade Options */}
      {subscription.status === 'active' && subscription.plan !== 'enterprise' && (
        <div className="card">
          <div className="card-header">
            <h3 className="text-lg font-semibold text-gray-900">Upgrade Your Plan</h3>
          </div>
          <div className="card-content">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              {Object.entries(SUBSCRIPTION_PLANS)
                .filter(([planId]) => {
                  const planOrder = { basic: 1, premium: 2, enterprise: 3 }
                  return planOrder[planId as keyof typeof planOrder] > planOrder[subscription.plan as keyof typeof planOrder]
                })
                .map(([planId, plan]) => (
                  <div key={planId} className="border border-gray-200 rounded-lg p-4">
                    <div className="flex items-center gap-3 mb-3">
                      {getPlanIcon(planId)}
                      <div>
                        <h4 className="font-semibold text-gray-900">{plan.name}</h4>
                        <p className="text-lg font-bold text-primary-600">
                          {formatPrice(plan.price)}/month
                        </p>
                      </div>
                    </div>
                    
                    <ul className="space-y-1 mb-4">
                      {plan.features.slice(0, 3).map((feature, index) => (
                        <li key={index} className="flex items-center gap-2 text-sm text-gray-700">
                          <CheckCircle className="h-3 w-3 text-success-600" />
                          <span>{feature}</span>
                        </li>
                      ))}
                      {plan.features.length > 3 && (
                        <li className="text-sm text-gray-500">
                          +{plan.features.length - 3} more features
                        </li>
                      )}
                    </ul>

                    <button
                      onClick={() => handleUpgradeSubscription(planId as SubscriptionPlan)}
                      disabled={actionLoading === 'upgrade'}
                      className="btn-primary btn-sm w-full"
                    >
                      {actionLoading === 'upgrade' ? (
                        <LoadingSpinner size="sm" />
                      ) : (
                        `Upgrade to ${plan.name}`
                      )}
                    </button>
                  </div>
                ))}
            </div>
          </div>
        </div>
      )}

      {/* Billing History */}
      <div className="card">
        <div className="card-header">
          <h3 className="text-lg font-semibold text-gray-900">Billing Information</h3>
        </div>
        <div className="card-content">
          <div className="space-y-4">
            <div className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
              <div className="flex items-center gap-3">
                <CreditCard className="h-5 w-5 text-gray-600" />
                <div>
                  <p className="font-medium text-gray-900">Payment Method</p>
                  <p className="text-sm text-gray-600">Manage your payment methods</p>
                </div>
              </div>
              <button
                onClick={handleManageBilling}
                disabled={actionLoading === 'portal'}
                className="btn-secondary btn-sm"
              >
                {actionLoading === 'portal' ? (
                  <LoadingSpinner size="sm" />
                ) : (
                  <>
                    <ExternalLink className="h-4 w-4 mr-1" />
                    Manage
                  </>
                )}
              </button>
            </div>

            <div className="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
              <div className="flex items-center gap-3">
                <Calendar className="h-5 w-5 text-gray-600" />
                <div>
                  <p className="font-medium text-gray-900">Billing History</p>
                  <p className="text-sm text-gray-600">View past invoices and payments</p>
                </div>
              </div>
              <button
                onClick={handleManageBilling}
                disabled={actionLoading === 'portal'}
                className="btn-secondary btn-sm"
              >
                {actionLoading === 'portal' ? (
                  <LoadingSpinner size="sm" />
                ) : (
                  <>
                    <ExternalLink className="h-4 w-4 mr-1" />
                    View History
                  </>
                )}
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Subscription Alerts */}
      {isExpiringSoon && subscription.status === 'active' && (
        <div className="card border-warning-200">
          <div className="card-content">
            <div className="flex items-center gap-3">
              <AlertTriangle className="h-6 w-6 text-warning-600" />
              <div>
                <h3 className="font-semibold text-warning-800">Subscription Expiring Soon</h3>
                <p className="text-sm text-warning-700">
                  Your subscription will renew on {format(new Date(subscription.current_period_end), 'MMMM dd, yyyy')}.
                  Make sure your payment method is up to date.
                </p>
              </div>
            </div>
          </div>
        </div>
      )}

      {subscription.status === 'past_due' && (
        <div className="card border-error-200">
          <div className="card-content">
            <div className="flex items-center gap-3">
              <AlertTriangle className="h-6 w-6 text-error-600" />
              <div>
                <h3 className="font-semibold text-error-800">Payment Required</h3>
                <p className="text-sm text-error-700">
                  Your subscription payment is past due. Please update your payment method to continue using the service.
                </p>
                <button
                  onClick={handleManageBilling}
                  className="btn-danger btn-sm mt-2"
                >
                  Update Payment Method
                </button>
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}