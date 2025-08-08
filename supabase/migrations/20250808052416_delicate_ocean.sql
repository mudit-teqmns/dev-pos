/*
  # Seed Kitchen Owners Data

  1. New Data
    - Sample kitchen owners with different subscription plans
    - Realistic names and contact information
    - Various subscription amounts and expiry dates
    - Mix of setup completed and pending statuses

  2. Purpose
    - Provides test data for kitchen owner management
    - Enables testing of subscription functionality
    - Creates realistic scenarios for development
*/

-- Insert sample kitchen owners
INSERT INTO kitchen_owners (id, email, full_name, subscription_plan, payment_id, subscription_amount, subscription_expires_at, password_hash, is_setup_completed) VALUES
  ('ko-111111-1111-1111-1111-111111111111', 'john.smith@example.com', 'John Smith', 'premium', 'sub_1234567890abcdef', 49.99, '2025-12-31 23:59:59+00', 'hashed_password_123', true),
  ('ko-222222-2222-2222-2222-222222222222', 'sarah.johnson@example.com', 'Sarah Johnson', 'basic', 'sub_abcdef1234567890', 29.99, '2025-11-15 23:59:59+00', 'hashed_password_456', true),
  ('ko-333333-3333-3333-3333-333333333333', 'mike.wilson@example.com', 'Mike Wilson', 'enterprise', 'sub_fedcba0987654321', 99.99, '2026-01-31 23:59:59+00', 'hashed_password_789', true),
  ('ko-444444-4444-4444-4444-444444444444', 'lisa.brown@example.com', 'Lisa Brown', 'premium', 'sub_1122334455667788', 49.99, '2025-10-20 23:59:59+00', 'hashed_password_abc', false),
  ('ko-555555-5555-5555-5555-555555555555', 'david.garcia@example.com', 'David Garcia', 'basic', 'sub_8877665544332211', 29.99, '2025-09-30 23:59:59+00', 'hashed_password_def', true);