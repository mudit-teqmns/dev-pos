/*
  # Seed Payments Data

  1. New Data
    - Payment records for completed orders
    - Different payment methods (cash, card, online)
    - Realistic transaction IDs and amounts
    - Various payment statuses

  2. Purpose
    - Provides test data for payment management
    - Enables testing of payment processing
    - Creates realistic financial transaction scenarios
*/

-- Insert sample payments
INSERT INTO payments (id, order_id, amount, method, status, transaction_id, processed_at) VALUES
  -- The Golden Spoon payments
  ('pay-111111-1111-1111-1111-111111111111', 'order-111111-1111-1111-1111-111111111111', 50.12, 'card', 'completed', 'txn_1234567890abcdef', '2025-01-13 19:35:00+00'),
  ('pay-111111-1111-1111-1111-111111111112', 'order-111111-1111-1111-1111-111111111112', 26.60, 'cash', 'completed', null, '2025-01-13 20:20:00+00'),
  ('pay-111111-1111-1111-1111-111111111113', 'order-111111-1111-1111-1111-111111111113', 64.09, 'online', 'pending', null, null),
  ('pay-111111-1111-1111-1111-111111111114', 'order-111111-1111-1111-1111-111111111114', 25.06, 'card', 'pending', null, null),
  
  -- Coastal Kitchen payments
  ('pay-222222-2222-2222-2222-222222222221', 'order-222222-2222-2222-2222-222222222221', 42.50, 'card', 'completed', 'txn_abcdef1234567890', '2025-01-13 19:05:00+00'),
  ('pay-222222-2222-2222-2222-222222222222', 'order-222222-2222-2222-2222-222222222222', 27.24, 'cash', 'completed', null, '2025-01-13 20:35:00+00'),
  
  -- Mountain View Bistro payments
  ('pay-333333-3333-3333-3333-333333333331', 'order-333333-3333-3333-3333-333333333331', 38.14, 'card', 'completed', 'txn_fedcba0987654321', '2025-01-13 19:50:00+00'),
  ('pay-333333-3333-3333-3333-333333333332', 'order-333333-3333-3333-3333-333333333332', 32.68, 'card', 'pending', null, null),
  
  -- Garden Fresh Cafe payments
  ('pay-555555-5555-5555-5555-555555555551', 'order-555555-5555-5555-5555-555555555551', 15.25, 'cash', 'completed', null, '2025-01-13 12:35:00+00'),
  ('pay-555555-5555-5555-5555-555555555552', 'order-555555-5555-5555-5555-555555555552', 28.32, 'card', 'completed', 'txn_1122334455667788', '2025-01-13 13:20:00+00');