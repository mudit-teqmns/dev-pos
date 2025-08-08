/*
  # Seed Restaurants Data

  1. New Data
    - Sample restaurants linked to kitchen owners
    - Realistic restaurant names and addresses
    - Unique domain names for each restaurant
    - Mix of active and inactive statuses

  2. Purpose
    - Provides test data for restaurant management
    - Enables testing of multi-restaurant functionality
    - Creates realistic business scenarios
*/

-- Insert sample restaurants
INSERT INTO restaurants (id, owner_id, name, address, phone_number, domain_name, status) VALUES
  ('rest-111111-1111-1111-1111-111111111111', 'ko-111111-1111-1111-1111-111111111111', 'The Golden Spoon', '123 Main Street, Downtown, CA 90210', '+1-555-0101', 'golden-spoon', 'active'),
  ('rest-222222-2222-2222-2222-222222222222', 'ko-222222-2222-2222-2222-222222222222', 'Coastal Kitchen', '456 Ocean View Blvd, Seaside, FL 33101', '+1-555-0202', 'coastal-kitchen', 'active'),
  ('rest-333333-3333-3333-3333-333333333333', 'ko-333333-3333-3333-3333-333333333333', 'Mountain View Bistro', '789 Highland Ave, Denver, CO 80202', '+1-555-0303', 'mountain-view-bistro', 'active'),
  ('rest-444444-4444-4444-4444-444444444444', 'ko-444444-4444-4444-4444-444444444444', 'Urban Eats', '321 City Center Dr, Chicago, IL 60601', '+1-555-0404', 'urban-eats', 'inactive'),
  ('rest-555555-5555-5555-5555-555555555555', 'ko-555555-5555-5555-5555-555555555555', 'Garden Fresh Cafe', '654 Park Lane, Austin, TX 78701', '+1-555-0505', 'garden-fresh-cafe', 'active');