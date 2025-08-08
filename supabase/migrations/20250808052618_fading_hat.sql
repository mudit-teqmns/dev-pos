/*
  # Seed Orders Data

  1. New Data
    - Sample orders for each restaurant
    - Different order types (dine_in, takeaway, delivery)
    - Various order statuses and amounts
    - Realistic order numbers and timestamps

  2. Purpose
    - Provides test data for order management
    - Enables testing of order processing workflow
    - Creates realistic order scenarios for analytics
*/

-- Insert sample orders
INSERT INTO orders (id, restaurant_id, customer_id, order_number, type, status, table_number, delivery_location, subtotal, tax_amount, discount_amount, total_amount, notes, created_at) VALUES
  -- The Golden Spoon orders
  ('order-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'cust-111111-1111-1111-1111-111111111111', '20250113-0001', 'dine_in', 'served', '12', null, 45.98, 4.14, 0.00, 50.12, 'Extra sauce on the side', '2025-01-13 19:30:00+00'),
  ('order-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'cust-111111-1111-1111-1111-111111111112', '20250113-0002', 'takeaway', 'ready', null, null, 28.99, 2.61, 5.00, 26.60, 'No onions please', '2025-01-13 20:15:00+00'),
  ('order-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', 'cust-111111-1111-1111-1111-111111111113', '20250113-0003', 'delivery', 'preparing', null, '456 Oak Street, Apt 2B', 67.97, 6.12, 10.00, 64.09, 'Ring doorbell twice', '2025-01-13 20:45:00+00'),
  ('order-111111-1111-1111-1111-111111111114', 'rest-111111-1111-1111-1111-111111111111', 'cust-111111-1111-1111-1111-111111111114', '20250113-0004', 'dine_in', 'pending', '8', null, 22.99, 2.07, 0.00, 25.06, null, '2025-01-13 21:00:00+00'),
  
  -- Coastal Kitchen orders
  ('order-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'cust-222222-2222-2222-2222-222222222221', '20250113-0001', 'dine_in', 'served', '5', null, 38.99, 3.51, 0.00, 42.50, 'Allergic to shellfish', '2025-01-13 19:00:00+00'),
  ('order-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', 'cust-222222-2222-2222-2222-222222222222', '20250113-0002', 'takeaway', 'ready', null, null, 24.99, 2.25, 0.00, 27.24, null, '2025-01-13 20:30:00+00'),
  
  -- Mountain View Bistro orders
  ('order-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'cust-333333-3333-3333-3333-333333333331', '20250113-0001', 'dine_in', 'served', '3', null, 34.99, 3.15, 0.00, 38.14, 'Medium rare please', '2025-01-13 19:45:00+00'),
  ('order-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'cust-333333-3333-3333-3333-333333333332', '20250113-0002', 'dine_in', 'preparing', '7', null, 29.98, 2.70, 0.00, 32.68, null, '2025-01-13 20:15:00+00'),
  
  -- Garden Fresh Cafe orders
  ('order-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'cust-555555-5555-5555-5555-555555555551', '20250113-0001', 'takeaway', 'served', null, null, 13.99, 1.26, 0.00, 15.25, 'Extra dressing', '2025-01-13 12:30:00+00'),
  ('order-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'cust-555555-5555-5555-5555-555555555552', '20250113-0002', 'dine_in', 'ready', '4', null, 25.98, 2.34, 0.00, 28.32, 'No nuts please', '2025-01-13 13:15:00+00');