/*
  # Seed Daily Deals Data

  1. New Data
    - Sample promotional deals for restaurants
    - Different discount types (percentage and fixed amount)
    - Various validity periods
    - Mix of active and expired deals

  2. Purpose
    - Provides test data for promotional management
    - Enables testing of discount functionality
    - Creates realistic promotional scenarios
*/

-- Insert sample daily deals
INSERT INTO daily_deals (id, restaurant_id, title, description, discount_percentage, discount_amount, applicable_items, valid_from, valid_until, is_active) VALUES
  -- The Golden Spoon deals
  ('deal-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'Happy Hour Special', '20% off all appetizers during happy hour', 20.00, null, '["item-111111-1111-1111-1111-111111111111", "item-111111-1111-1111-1111-111111111112"]', '2025-01-01 17:00:00+00', '2025-12-31 19:00:00+00', true),
  ('deal-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'Weekend Wine Special', '$10 off wine bottles on weekends', null, 10.00, '[]', '2025-01-01 00:00:00+00', '2025-12-31 23:59:59+00', true),
  ('deal-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', 'Early Bird Dinner', '15% off main courses before 6 PM', 15.00, null, '["item-111111-1111-1111-1111-111111111121", "item-111111-1111-1111-1111-111111111122"]', '2025-01-01 16:00:00+00', '2025-12-31 18:00:00+00', true),
  
  -- Coastal Kitchen deals
  ('deal-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'Seafood Tuesday', '25% off all seafood dishes on Tuesdays', 25.00, null, '["item-222222-2222-2222-2222-222222222221", "item-222222-2222-2222-2222-222222222222"]', '2025-01-01 00:00:00+00', '2025-12-31 23:59:59+00', true),
  ('deal-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', 'Sunset Special', '$5 off orders over $30 during sunset hours', null, 5.00, '[]', '2025-01-01 17:30:00+00', '2025-12-31 19:30:00+00', true),
  
  -- Mountain View Bistro deals
  ('deal-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'Mountain Monday', '30% off elk dishes on Mondays', 30.00, null, '["item-333333-3333-3333-3333-333333333331"]', '2025-01-01 00:00:00+00', '2025-12-31 23:59:59+00', true),
  ('deal-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'Soup & Bread Combo', '$3 off when ordering soup with bread', null, 3.00, '["item-333333-3333-3333-3333-333333333341", "item-333333-3333-3333-3333-333333333342"]', '2025-01-01 00:00:00+00', '2025-12-31 23:59:59+00', true),
  
  -- Garden Fresh Cafe deals
  ('deal-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'Healthy Lunch Deal', '20% off salads during lunch hours', 20.00, null, '["item-555555-5555-5555-5555-555555555551", "item-555555-5555-5555-5555-555555555552"]', '2025-01-01 11:00:00+00', '2025-12-31 15:00:00+00', true),
  ('deal-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'Organic Wednesday', '15% off all organic entrees on Wednesdays', 15.00, null, '["item-555555-5555-5555-5555-555555555561", "item-555555-5555-5555-5555-555555555562"]', '2025-01-01 00:00:00+00', '2025-12-31 23:59:59+00', true);