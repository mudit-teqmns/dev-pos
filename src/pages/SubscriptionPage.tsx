import React from 'react'
import { useAuth } from '../contexts/AuthContext'
import Layout from '../components/Layout'
import SubscriptionManagement from '../components/SubscriptionManagement'
import { CreditCard } from 'lucide-react'

export default function SubscriptionPage() {
  const { user } = useAuth()

  if (user?.role !== 'kitchen_owner') {
    return (
      <Layout>
        <div className="text-center py-8">
          <CreditCard className="h-12 w-12 text-gray-400 mx-auto mb-4" />
          <p className="text-gray-600">Access denied. Only kitchen owners can manage subscriptions.</p>
        </div>
      </Layout>
    )
  }

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Subscription Management</h1>
          <p className="text-gray-600">Manage your Kitchen POS subscription and billing</p>
        </div>

        <SubscriptionManagement />
      </div>
    </Layout>
  )
}