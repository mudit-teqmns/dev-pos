/*
  # Seed Barcodes Data

  1. New Data
    - QR codes for tables, counters, and menus
    - Unique codes for each restaurant
    - Different barcode types for various use cases
    - All barcodes set as active

  2. Purpose
    - Provides test data for QR code management
    - Enables testing of barcode scanning functionality
    - Creates realistic QR code scenarios
*/

-- Insert sample barcodes
INSERT INTO barcodes (id, restaurant_id, code, type, identifier, is_active) VALUES
  -- The Golden Spoon barcodes
  ('bc-111111-1111-1111-1111-111111111111', 'rest-111111-1111-1111-1111-111111111111', 'GS-TABLE-001-2025', 'table', 'Table 1', true),
  ('bc-111111-1111-1111-1111-111111111112', 'rest-111111-1111-1111-1111-111111111111', 'GS-TABLE-002-2025', 'table', 'Table 2', true),
  ('bc-111111-1111-1111-1111-111111111113', 'rest-111111-1111-1111-1111-111111111111', 'GS-TABLE-003-2025', 'table', 'Table 3', true),
  ('bc-111111-1111-1111-1111-111111111114', 'rest-111111-1111-1111-1111-111111111111', 'GS-COUNTER-001-2025', 'counter', 'Takeout Counter', true),
  ('bc-111111-1111-1111-1111-111111111115', 'rest-111111-1111-1111-1111-111111111111', 'GS-MENU-001-2025', 'menu', 'Main Menu', true),
  
  -- Coastal Kitchen barcodes
  ('bc-222222-2222-2222-2222-222222222221', 'rest-222222-2222-2222-2222-222222222222', 'CK-TABLE-001-2025', 'table', 'Table 1', true),
  ('bc-222222-2222-2222-2222-222222222222', 'rest-222222-2222-2222-2222-222222222222', 'CK-TABLE-002-2025', 'table', 'Table 2', true),
  ('bc-222222-2222-2222-2222-222222222223', 'rest-222222-2222-2222-2222-222222222222', 'CK-PATIO-001-2025', 'table', 'Patio Table 1', true),
  ('bc-222222-2222-2222-2222-222222222224', 'rest-222222-2222-2222-2222-222222222222', 'CK-MENU-001-2025', 'menu', 'Seafood Menu', true),
  
  -- Mountain View Bistro barcodes
  ('bc-333333-3333-3333-3333-333333333331', 'rest-333333-3333-3333-3333-333333333333', 'MVB-TABLE-001-2025', 'table', 'Table 1', true),
  ('bc-333333-3333-3333-3333-333333333332', 'rest-333333-3333-3333-3333-333333333333', 'MVB-TABLE-002-2025', 'table', 'Table 2', true),
  ('bc-333333-3333-3333-3333-333333333333', 'rest-333333-3333-3333-3333-333333333333', 'MVB-COUNTER-001-2025', 'counter', 'Alpine Counter', true),
  
  -- Garden Fresh Cafe barcodes
  ('bc-555555-5555-5555-5555-555555555551', 'rest-555555-5555-5555-5555-555555555555', 'GFC-TABLE-001-2025', 'table', 'Table 1', true),
  ('bc-555555-5555-5555-5555-555555555552', 'rest-555555-5555-5555-5555-555555555555', 'GFC-TABLE-002-2025', 'table', 'Table 2', true),
  ('bc-555555-5555-5555-5555-555555555553', 'rest-555555-5555-5555-5555-555555555555', 'GFC-PATIO-001-2025', 'table', 'Garden Table 1', true),
  ('bc-555555-5555-5555-5555-555555555554', 'rest-555555-5555-5555-5555-555555555555', 'GFC-MENU-001-2025', 'menu', 'Healthy Menu', true);