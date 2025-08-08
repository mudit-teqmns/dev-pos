/*
  # Seed Kitchen Golf Course Assignments Data

  1. New Data
    - Assignments linking kitchens to golf courses
    - Realistic assignment patterns
    - Different kitchens serving different courses
    - All assignments set as active

  2. Purpose
    - Provides test data for golf course assignment management
    - Enables testing of kitchen-golf course relationships
    - Creates realistic service area scenarios
*/

-- Insert sample kitchen golf course assignments
INSERT INTO kitchen_golf_course_assignments (id, kitchen_id, golf_course_id, is_active) VALUES
  -- The Golden Spoon assignments
  ('kgca-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', '11111111-1111-1111-1111-111111111111', true), -- Pebble Beach
  ('kgca-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', true), -- Torrey Pines
  ('kgca-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', '77777777-7777-7777-7777-777777777777', true), -- Bethpage Black
  
  -- Coastal Kitchen assignments
  ('kgca-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', '88888888-8888-8888-8888-888888888888', true), -- TPC Sawgrass
  ('kgca-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', '99999999-9999-9999-9999-999999999999', true), -- Kiawah Island
  
  -- Mountain View Bistro assignments
  ('kgca-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', '55555555-5555-5555-5555-555555555555', true), -- Whistling Straits
  ('kgca-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', true), -- Bandon Dunes
  
  -- Garden Fresh Cafe assignments
  ('kgca-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', '66666666-6666-6666-6666-666666666666', true), -- Pinehurst Resort
  ('kgca-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', '33333333-3333-3333-3333-333333333333', true), -- St. Andrews Links
  ('kgca-555555-5555-5555-5555-555555555553', 'rest-555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', true); -- Augusta National