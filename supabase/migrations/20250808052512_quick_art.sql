/*
  # Seed Menu Categories Data

  1. New Data
    - Menu categories for each revenue center
    - Realistic category names and descriptions
    - Proper sort ordering for menu display

  2. Purpose
    - Provides test data for menu management
    - Enables testing of category-based menu organization
    - Creates realistic menu structures
*/

-- Insert sample menu categories
INSERT INTO menu_categories (id, restaurant_id, revenue_center_id, name, description, sort_order, is_active) VALUES
  -- The Golden Spoon categories
  ('cat-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'rc-111111-1111-1111-1111-111111111111', 'Appetizers', 'Start your meal with our delicious appetizers', 10, true),
  ('cat-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'rc-111111-1111-1111-1111-111111111111', 'Main Courses', 'Hearty and satisfying main dishes', 20, true),
  ('cat-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', 'rc-111111-1111-1111-1111-111111111111', 'Desserts', 'Sweet endings to your perfect meal', 30, true),
  ('cat-111111-1111-1111-1111-111111111114', 'rest-111111-1111-1111-1111-111111111111', 'rc-111111-1111-1111-1111-111111111112', 'Cocktails', 'Handcrafted cocktails and mixed drinks', 10, true),
  ('cat-111111-1111-1111-1111-111111111115', 'rest-111111-1111-1111-1111-111111111111', 'rc-111111-1111-1111-1111-111111111112', 'Wine & Beer', 'Curated selection of wines and craft beers', 20, true),
  
  -- Coastal Kitchen categories
  ('cat-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'rc-222222-2222-2222-2222-222222222221', 'Seafood Specialties', 'Fresh catch from local waters', 10, true),
  ('cat-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', 'rc-222222-2222-2222-2222-222222222221', 'Coastal Classics', 'Traditional coastal cuisine favorites', 20, true),
  ('cat-222222-2222-2222-2222-222222222223', 'rest-222222-2222-2222-2222-222222222222', 'rc-222222-2222-2222-2222-222222222222', 'Tropical Drinks', 'Refreshing tropical cocktails', 10, true),
  
  -- Mountain View Bistro categories
  ('cat-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'rc-333333-3333-3333-3333-333333333331', 'Mountain Fare', 'Hearty mountain-inspired dishes', 10, true),
  ('cat-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'rc-333333-3333-3333-3333-333333333331', 'Alpine Soups', 'Warming soups for mountain weather', 20, true),
  ('cat-333333-3333-3333-3333-333333333333', 'rest-333333-3333-3333-3333-333333333333', 'rc-333333-3333-3333-3333-333333333332', 'Summit Spirits', 'Premium spirits and mountain cocktails', 10, true),
  
  -- Garden Fresh Cafe categories
  ('cat-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'rc-555555-5555-5555-5555-555555555551', 'Fresh Salads', 'Garden-fresh salads and healthy bowls', 10, true),
  ('cat-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'rc-555555-5555-5555-5555-555555555551', 'Organic Entrees', 'Organic and locally-sourced main dishes', 20, true),
  ('cat-555555-5555-5555-5555-555555555553', 'rest-555555-5555-5555-5555-555555555555', 'rc-555555-5555-5555-5555-555555555552', 'Fresh Juices', 'Cold-pressed juices and smoothies', 10, true);