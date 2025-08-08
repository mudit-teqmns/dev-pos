/*
  # Seed Combo Meals Data

  1. New Data
    - Sample combo meal packages
    - Bundled items with discounted pricing
    - Realistic combo descriptions and images
    - Mix of available and unavailable combos

  2. Purpose
    - Provides test data for combo meal management
    - Enables testing of bundled item functionality
    - Creates realistic meal package scenarios
*/

-- Insert sample combo meals
INSERT INTO combo_meals (id, restaurant_id, name, description, price, image_url, items, is_available) VALUES
  -- The Golden Spoon combos
  ('combo-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'Date Night Special', 'Two appetizers, two main courses, dessert to share, and a bottle of wine', 89.99, 'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg', '[
    {"item_id": "item-111111-1111-1111-1111-111111111111", "quantity": 2, "name": "Truffle Arancini"},
    {"item_id": "item-111111-1111-1111-1111-111111111122", "quantity": 2, "name": "Pan-Seared Salmon"},
    {"item_id": "item-111111-1111-1111-1111-111111111131", "quantity": 1, "name": "Chocolate Lava Cake"}
  ]', true),
  
  ('combo-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'Business Lunch', 'Appetizer, main course, and coffee', 32.99, 'https://images.pexels.com/photos/262959/pexels-photo-262959.jpeg', '[
    {"item_id": "item-111111-1111-1111-1111-111111111111", "quantity": 1, "name": "Truffle Arancini"},
    {"item_id": "item-111111-1111-1111-1111-111111111122", "quantity": 1, "name": "Pan-Seared Salmon"}
  ]', true),
  
  -- Coastal Kitchen combos
  ('combo-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'Seafood Feast', 'Lobster thermidor, grilled mahi-mahi, and clam chowder', 65.99, 'https://images.pexels.com/photos/725991/pexels-photo-725991.jpeg', '[
    {"item_id": "item-222222-2222-2222-2222-222222222221", "quantity": 1, "name": "Lobster Thermidor"},
    {"item_id": "item-222222-2222-2222-2222-222222222222", "quantity": 1, "name": "Grilled Mahi-Mahi"},
    {"item_id": "item-222222-2222-2222-2222-222222222232", "quantity": 1, "name": "Clam Chowder"}
  ]', true),
  
  -- Mountain View Bistro combos
  ('combo-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'Mountain Explorer', 'Elk medallions with butternut squash soup and bread', 42.99, 'https://images.pexels.com/photos/361184/asparagus-steak-veal-chop-veal-361184.jpeg', '[
    {"item_id": "item-333333-3333-3333-3333-333333333331", "quantity": 1, "name": "Elk Medallions"},
    {"item_id": "item-333333-3333-3333-3333-333333333342", "quantity": 1, "name": "Butternut Squash Soup"}
  ]', true),
  
  -- Garden Fresh Cafe combos
  ('combo-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'Healthy Choice', 'Quinoa power bowl with fresh juice', 18.99, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', '[
    {"item_id": "item-555555-5555-5555-5555-555555555551", "quantity": 1, "name": "Quinoa Power Bowl"}
  ]', true),
  
  ('combo-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'Garden Lunch', 'Kale caesar salad with grass-fed burger', 26.99, 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg', '[
    {"item_id": "item-555555-5555-5555-5555-555555555552", "quantity": 1, "name": "Kale Caesar Salad"},
    {"item_id": "item-555555-5555-5555-5555-555555555561", "quantity": 1, "name": "Grass-Fed Burger"}
  ]', true);