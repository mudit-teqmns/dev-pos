/*
  # Seed Customers Data

  1. New Data
    - Sample customers for each restaurant
    - Realistic customer information
    - Varied order history and spending patterns
    - Mix of regular and new customers

  2. Purpose
    - Provides test data for customer management
    - Enables testing of customer analytics
    - Creates realistic customer scenarios
*/

-- Insert sample customers
INSERT INTO customers (id, restaurant_id, name, email, phone, total_orders, total_spent, last_order_at) VALUES
  -- The Golden Spoon customers
  ('cust-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'Alice Cooper', 'alice.cooper@email.com', '+1-555-1001', 15, 487.50, '2025-01-10 19:30:00+00'),
  ('cust-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'Bob Johnson', 'bob.johnson@email.com', '+1-555-1002', 8, 234.75, '2025-01-08 20:15:00+00'),
  ('cust-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', 'Carol Davis', 'carol.davis@email.com', '+1-555-1003', 22, 678.90, '2025-01-12 18:45:00+00'),
  ('cust-111111-1111-1111-1111-111111111114', 'rest-111111-1111-1111-1111-111111111111', 'David Wilson', null, '+1-555-1004', 3, 89.25, '2025-01-05 21:00:00+00'),
  
  -- Coastal Kitchen customers
  ('cust-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'Emma Thompson', 'emma.thompson@email.com', '+1-555-2001', 12, 356.80, '2025-01-11 19:00:00+00'),
  ('cust-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', 'Frank Miller', 'frank.miller@email.com', '+1-555-2002', 6, 178.45, '2025-01-09 20:30:00+00'),
  ('cust-222222-2222-2222-2222-222222222223', 'rest-222222-2222-2222-2222-222222222222', 'Grace Lee', 'grace.lee@email.com', '+1-555-2003', 18, 542.30, '2025-01-13 18:15:00+00'),
  
  -- Mountain View Bistro customers
  ('cust-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'Henry Adams', 'henry.adams@email.com', '+1-555-3001', 9, 287.65, '2025-01-07 19:45:00+00'),
  ('cust-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'Ivy Chen', 'ivy.chen@email.com', '+1-555-3002', 14, 423.20, '2025-01-12 20:00:00+00'),
  
  -- Garden Fresh Cafe customers
  ('cust-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'Jack Robinson', 'jack.robinson@email.com', '+1-555-5001', 25, 312.75, '2025-01-13 12:30:00+00'),
  ('cust-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'Kate Martinez', 'kate.martinez@email.com', '+1-555-5002', 11, 156.89, '2025-01-10 13:15:00+00'),
  ('cust-555555-5555-5555-5555-555555555553', 'rest-555555-5555-5555-5555-555555555555', 'Liam O''Connor', 'liam.oconnor@email.com', '+1-555-5003', 7, 98.45, '2025-01-08 14:00:00+00');