/*
  # Seed Menu Items Data

  1. New Data
    - Realistic menu items for each category
    - Varied pricing and preparation times
    - High-quality food images from Pexels
    - Mix of available and unavailable items

  2. Purpose
    - Provides comprehensive test data for menu management
    - Enables testing of menu item functionality
    - Creates realistic restaurant menus for demonstration
*/

-- Insert sample menu items
INSERT INTO menu_items (id, restaurant_id, category_id, name, description, price, image_url, is_available, preparation_time, sort_order) VALUES
  -- The Golden Spoon - Appetizers
  ('item-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111111', 'Truffle Arancini', 'Crispy risotto balls with truffle oil and parmesan', 14.99, 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg', true, 12, 10),
  ('item-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111111', 'Seared Scallops', 'Pan-seared scallops with cauliflower puree', 18.99, 'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg', true, 15, 20),
  ('item-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111111', 'Charcuterie Board', 'Selection of artisanal meats and cheeses', 22.99, 'https://images.pexels.com/photos/1435735/pexels-photo-1435735.jpeg', true, 8, 30),
  
  -- The Golden Spoon - Main Courses
  ('item-111111-1111-1111-1111-111111111121', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111112', 'Wagyu Beef Tenderloin', 'Premium wagyu with roasted vegetables and red wine jus', 45.99, 'https://images.pexels.com/photos/361184/asparagus-steak-veal-chop-veal-361184.jpeg', true, 25, 10),
  ('item-111111-1111-1111-1111-111111111122', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111112', 'Pan-Seared Salmon', 'Atlantic salmon with lemon herb butter and quinoa', 28.99, 'https://images.pexels.com/photos/262959/pexels-photo-262959.jpeg', true, 20, 20),
  ('item-111111-1111-1111-1111-111111111123', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111112', 'Duck Confit', 'Slow-cooked duck leg with cherry gastrique', 32.99, 'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg', false, 30, 30),
  
  -- The Golden Spoon - Desserts
  ('item-111111-1111-1111-1111-111111111131', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111113', 'Chocolate Lava Cake', 'Warm chocolate cake with molten center and vanilla ice cream', 9.99, 'https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg', true, 12, 10),
  ('item-111111-1111-1111-1111-111111111132', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111113', 'Crème Brûlée', 'Classic vanilla custard with caramelized sugar', 8.99, 'https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg', true, 5, 20),
  
  -- The Golden Spoon - Bar Items
  ('item-111111-1111-1111-1111-111111111141', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111114', 'Golden Martini', 'Premium vodka with gold flakes and olive garnish', 16.99, 'https://images.pexels.com/photos/338713/pexels-photo-338713.jpeg', true, 5, 10),
  ('item-111111-1111-1111-1111-111111111142', 'rest-111111-1111-1111-1111-111111111111', 'cat-111111-1111-1111-1111-111111111115', 'Craft Beer Flight', 'Selection of four local craft beers', 12.99, 'https://images.pexels.com/photos/1552630/pexels-photo-1552630.jpeg', true, 3, 10),
  
  -- Coastal Kitchen - Seafood
  ('item-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'cat-222222-2222-2222-2222-222222222221', 'Lobster Thermidor', 'Fresh lobster with creamy thermidor sauce', 38.99, 'https://images.pexels.com/photos/725991/pexels-photo-725991.jpeg', true, 25, 10),
  ('item-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', 'cat-222222-2222-2222-2222-222222222221', 'Grilled Mahi-Mahi', 'Grilled mahi-mahi with tropical fruit salsa', 24.99, 'https://images.pexels.com/photos/725991/pexels-photo-725991.jpeg', true, 18, 20),
  
  -- Coastal Kitchen - Classics
  ('item-222222-2222-2222-2222-222222222231', 'rest-222222-2222-2222-2222-222222222222', 'cat-222222-2222-2222-2222-222222222222', 'Fish & Chips', 'Beer-battered cod with hand-cut fries', 16.99, 'https://images.pexels.com/photos/1633578/pexels-photo-1633578.jpeg', true, 15, 10),
  ('item-222222-2222-2222-2222-222222222232', 'rest-222222-2222-2222-2222-222222222222', 'cat-222222-2222-2222-2222-222222222222', 'Clam Chowder', 'New England style clam chowder with sourdough bread', 8.99, 'https://images.pexels.com/photos/539451/pexels-photo-539451.jpeg', true, 10, 20),
  
  -- Mountain View Bistro - Mountain Fare
  ('item-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'cat-333333-3333-3333-3333-333333333331', 'Elk Medallions', 'Grilled elk medallions with juniper berry sauce', 34.99, 'https://images.pexels.com/photos/361184/asparagus-steak-veal-chop-veal-361184.jpeg', true, 22, 10),
  ('item-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'cat-333333-3333-3333-3333-333333333331', 'Wild Mushroom Risotto', 'Creamy risotto with foraged mountain mushrooms', 19.99, 'https://images.pexels.com/photos/1279330/pexels-photo-1279330.jpeg', true, 18, 20),
  
  -- Mountain View Bistro - Soups
  ('item-333333-3333-3333-3333-333333333341', 'rest-333333-3333-3333-3333-333333333333', 'cat-333333-3333-3333-3333-333333333332', 'Bison Chili', 'Hearty bison chili with cornbread', 12.99, 'https://images.pexels.com/photos/539451/pexels-photo-539451.jpeg', true, 15, 10),
  ('item-333333-3333-3333-3333-333333333342', 'rest-333333-3333-3333-3333-333333333333', 'cat-333333-3333-3333-3333-333333333332', 'Butternut Squash Soup', 'Roasted butternut squash soup with sage', 9.99, 'https://images.pexels.com/photos/539451/pexels-photo-539451.jpeg', true, 12, 20),
  
  -- Garden Fresh Cafe - Salads
  ('item-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'cat-555555-5555-5555-5555-555555555551', 'Quinoa Power Bowl', 'Quinoa with roasted vegetables and tahini dressing', 13.99, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', true, 10, 10),
  ('item-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'cat-555555-5555-5555-5555-555555555551', 'Kale Caesar Salad', 'Massaged kale with house-made caesar dressing', 11.99, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', true, 8, 20),
  
  -- Garden Fresh Cafe - Organic Entrees
  ('item-555555-5555-5555-5555-555555555561', 'rest-555555-5555-5555-5555-555555555555', 'cat-555555-5555-5555-5555-555555555552', 'Grass-Fed Burger', 'Organic grass-fed beef with sweet potato fries', 16.99, 'https://images.pexels.com/photos/1639557/pexels-photo-1639557.jpeg', true, 15, 10),
  ('item-555555-5555-5555-5555-555555555562', 'rest-555555-5555-5555-5555-555555555555', 'cat-555555-5555-5555-5555-555555555552', 'Vegan Buddha Bowl', 'Colorful bowl with organic vegetables and tahini', 14.99, 'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg', true, 12, 20);