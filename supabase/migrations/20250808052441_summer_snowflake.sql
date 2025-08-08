/*
  # Seed Users Data

  1. New Data
    - Kitchen owner users linked to auth system
    - Manager and staff users for each restaurant
    - Different roles and permissions
    - All users set as active

  2. Purpose
    - Provides test data for user management
    - Enables testing of role-based access control
    - Creates realistic team structures
*/

-- Insert kitchen owner users (linked to kitchen_owners table)
INSERT INTO users (id, auth_user_id, email, full_name, role, restaurant_id, is_active) VALUES
  ('user-ko-111111-1111-1111-1111-111111111111', null, 'john.smith@example.com', 'John Smith', 'kitchen_owner', 'rest-111111-1111-1111-1111-111111111111', true),
  ('user-ko-222222-2222-2222-2222-222222222222', null, 'sarah.johnson@example.com', 'Sarah Johnson', 'kitchen_owner', 'rest-222222-2222-2222-2222-222222222222', true),
  ('user-ko-333333-3333-3333-3333-333333333333', null, 'mike.wilson@example.com', 'Mike Wilson', 'kitchen_owner', 'rest-333333-3333-3333-3333-333333333333', true),
  ('user-ko-444444-4444-4444-4444-444444444444', null, 'lisa.brown@example.com', 'Lisa Brown', 'kitchen_owner', 'rest-444444-4444-4444-4444-444444444444', true),
  ('user-ko-555555-5555-5555-5555-555555555555', null, 'david.garcia@example.com', 'David Garcia', 'kitchen_owner', 'rest-555555-5555-5555-5555-555555555555', true);

-- Insert manager users
INSERT INTO users (id, auth_user_id, email, full_name, role, restaurant_id, is_active) VALUES
  ('user-mgr-111111-1111-1111-1111-111111111111', null, 'manager1@goldenspoon.com', 'Emily Chen', 'manager', 'rest-111111-1111-1111-1111-111111111111', true),
  ('user-mgr-222222-2222-2222-2222-222222222222', null, 'manager1@coastalkitchen.com', 'Robert Martinez', 'manager', 'rest-222222-2222-2222-2222-222222222222', true),
  ('user-mgr-333333-3333-3333-3333-333333333333', null, 'manager1@mountainview.com', 'Jennifer Taylor', 'manager', 'rest-333333-3333-3333-3333-333333333333', true),
  ('user-mgr-555555-5555-5555-5555-555555555555', null, 'manager1@gardenfresh.com', 'Alex Thompson', 'manager', 'rest-555555-5555-5555-5555-555555555555', true);

-- Insert staff users
INSERT INTO users (id, auth_user_id, email, full_name, role, restaurant_id, is_active) VALUES
  -- The Golden Spoon staff
  ('user-staff-111111-1111-1111-1111-111111111111', null, 'chef1@goldenspoon.com', 'Carlos Rodriguez', 'staff', 'rest-111111-1111-1111-1111-111111111111', true),
  ('user-staff-111111-1111-1111-1111-111111111112', null, 'server1@goldenspoon.com', 'Maria Lopez', 'staff', 'rest-111111-1111-1111-1111-111111111111', true),
  ('user-staff-111111-1111-1111-1111-111111111113', null, 'bartender1@goldenspoon.com', 'James Wilson', 'staff', 'rest-111111-1111-1111-1111-111111111111', true),
  
  -- Coastal Kitchen staff
  ('user-staff-222222-2222-2222-2222-222222222221', null, 'chef1@coastalkitchen.com', 'Isabella Davis', 'staff', 'rest-222222-2222-2222-2222-222222222222', true),
  ('user-staff-222222-2222-2222-2222-222222222222', null, 'server1@coastalkitchen.com', 'Michael Brown', 'staff', 'rest-222222-2222-2222-2222-222222222222', true),
  
  -- Mountain View Bistro staff
  ('user-staff-333333-3333-3333-3333-333333333331', null, 'chef1@mountainview.com', 'Sophia Anderson', 'staff', 'rest-333333-3333-3333-3333-333333333333', true),
  ('user-staff-333333-3333-3333-3333-333333333332', null, 'server1@mountainview.com', 'Daniel White', 'staff', 'rest-333333-3333-3333-3333-333333333333', true),
  
  -- Garden Fresh Cafe staff
  ('user-staff-555555-5555-5555-5555-555555555551', null, 'chef1@gardenfresh.com', 'Olivia Miller', 'staff', 'rest-555555-5555-5555-5555-555555555555', true),
  ('user-staff-555555-5555-5555-5555-555555555552', null, 'server1@gardenfresh.com', 'Ethan Jones', 'staff', 'rest-555555-5555-5555-5555-555555555555', true);

-- Update kitchen_owners table with user_id references
UPDATE kitchen_owners SET user_id = 'user-ko-111111-1111-1111-1111-111111111111' WHERE id = 'ko-111111-1111-1111-1111-111111111111';
UPDATE kitchen_owners SET user_id = 'user-ko-222222-2222-2222-2222-222222222222' WHERE id = 'ko-222222-2222-2222-2222-222222222222';
UPDATE kitchen_owners SET user_id = 'user-ko-333333-3333-3333-3333-333333333333' WHERE id = 'ko-333333-3333-3333-3333-333333333333';
UPDATE kitchen_owners SET user_id = 'user-ko-444444-4444-4444-4444-444444444444' WHERE id = 'ko-444444-4444-4444-4444-444444444444';
UPDATE kitchen_owners SET user_id = 'user-ko-555555-5555-5555-5555-555555555555' WHERE id = 'ko-555555-5555-5555-5555-555555555555';