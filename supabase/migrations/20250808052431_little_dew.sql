/*
  # Seed Revenue Centers Data

  1. New Data
    - Revenue centers for each restaurant
    - Different types: restaurant, bar, patio, takeout
    - All centers set as active

  2. Purpose
    - Provides test data for revenue center management
    - Enables testing of multi-center functionality
    - Creates realistic business scenarios with different service areas
*/

-- Insert sample revenue centers
INSERT INTO revenue_centers (id, restaurant_id, name, type, is_active) VALUES
  -- The Golden Spoon revenue centers
  ('rc-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'Main Dining Room', 'restaurant', true),
  ('rc-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'Golden Bar', 'bar', true),
  ('rc-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', 'Takeout Counter', 'takeout', true),
  
  -- Coastal Kitchen revenue centers
  ('rc-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'Ocean View Dining', 'restaurant', true),
  ('rc-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', 'Tiki Bar', 'bar', true),
  ('rc-222222-2222-2222-2222-222222222223', 'rest-222222-2222-2222-2222-222222222222', 'Beachside Patio', 'patio', true),
  
  -- Mountain View Bistro revenue centers
  ('rc-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'Alpine Dining', 'restaurant', true),
  ('rc-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'Summit Lounge', 'bar', true),
  
  -- Urban Eats revenue centers
  ('rc-444444-4444-4444-4444-444444444441', 'rest-444444-4444-4444-4444-444444444444', 'City Dining', 'restaurant', true),
  ('rc-444444-4444-4444-4444-444444444442', 'rest-444444-4444-4444-4444-444444444444', 'Express Counter', 'takeout', true),
  
  -- Garden Fresh Cafe revenue centers
  ('rc-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'Garden Dining', 'restaurant', true),
  ('rc-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'Fresh Bar', 'bar', true),
  ('rc-555555-5555-5555-5555-555555555553', 'rest-555555-5555-5555-5555-555555555555', 'Garden Patio', 'patio', true);