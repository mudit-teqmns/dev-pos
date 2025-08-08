/*
  # Seed Staff Assignments Data

  1. New Data
    - Staff assignments to revenue centers
    - Realistic assignment patterns
    - Different staff working in different areas

  2. Purpose
    - Provides test data for staff management
    - Enables testing of revenue center assignments
    - Creates realistic work allocation scenarios
*/

-- Insert staff assignments
INSERT INTO staff_assignments (id, user_id, revenue_center_id) VALUES
  -- The Golden Spoon assignments
  ('sa-111111-1111-1111-1111-111111111111', 'user-staff-111111-1111-1111-1111-111111111111', 'rc-111111-1111-1111-1111-111111111111'), -- Chef to Main Dining
  ('sa-111111-1111-1111-1111-111111111112', 'user-staff-111111-1111-1111-1111-111111111112', 'rc-111111-1111-1111-1111-111111111111'), -- Server to Main Dining
  ('sa-111111-1111-1111-1111-111111111113', 'user-staff-111111-1111-1111-1111-111111111113', 'rc-111111-1111-1111-1111-111111111112'), -- Bartender to Bar
  
  -- Coastal Kitchen assignments
  ('sa-222222-2222-2222-2222-222222222221', 'user-staff-222222-2222-2222-2222-222222222221', 'rc-222222-2222-2222-2222-222222222221'), -- Chef to Ocean View Dining
  ('sa-222222-2222-2222-2222-222222222222', 'user-staff-222222-2222-2222-2222-222222222222', 'rc-222222-2222-2222-2222-222222222221'), -- Server to Ocean View Dining
  ('sa-222222-2222-2222-2222-222222222223', 'user-staff-222222-2222-2222-2222-222222222222', 'rc-222222-2222-2222-2222-222222222223'), -- Server also to Patio
  
  -- Mountain View Bistro assignments
  ('sa-333333-3333-3333-3333-333333333331', 'user-staff-333333-3333-3333-3333-333333333331', 'rc-333333-3333-3333-3333-333333333331'), -- Chef to Alpine Dining
  ('sa-333333-3333-3333-3333-333333333332', 'user-staff-333333-3333-3333-3333-333333333332', 'rc-333333-3333-3333-3333-333333333331'), -- Server to Alpine Dining
  ('sa-333333-3333-3333-3333-333333333333', 'user-staff-333333-3333-3333-3333-333333333332', 'rc-333333-3333-3333-3333-333333333332'), -- Server also to Lounge
  
  -- Garden Fresh Cafe assignments
  ('sa-555555-5555-5555-5555-555555555551', 'user-staff-555555-5555-5555-5555-555555555551', 'rc-555555-5555-5555-5555-555555555551'), -- Chef to Garden Dining
  ('sa-555555-5555-5555-5555-555555555552', 'user-staff-555555-5555-5555-5555-555555555552', 'rc-555555-5555-5555-5555-555555555551'), -- Server to Garden Dining
  ('sa-555555-5555-5555-5555-555555555553', 'user-staff-555555-5555-5555-5555-555555555552', 'rc-555555-5555-5555-5555-555555555553'); -- Server also to Patio