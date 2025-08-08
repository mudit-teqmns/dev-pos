/*
  # Seed Golf Courses Data

  1. New Data
    - Golf courses with realistic names and locations
    - Contact information for each course
    - All courses set as active

  2. Purpose
    - Provides sample golf courses for kitchen assignments
    - Enables testing of golf course selection functionality
    - Creates realistic data for development and testing
*/

-- Insert sample golf courses
INSERT INTO golf_courses (id, name, address, phone_number, email, website, is_active) VALUES
  ('11111111-1111-1111-1111-111111111111', 'Pebble Beach Golf Links', '1700 17-Mile Drive, Pebble Beach, CA 93953', '+1-831-624-3811', 'info@pebblebeach.com', 'https://www.pebblebeach.com', true),
  ('22222222-2222-2222-2222-222222222222', 'Augusta National Golf Club', '2604 Washington Rd, Augusta, GA 30904', '+1-706-667-6000', 'contact@augusta.com', 'https://www.masters.com', true),
  ('33333333-3333-3333-3333-333333333333', 'St. Andrews Links', 'Pilmour House, St Andrews KY16 9SF, Scotland', '+44-1334-466666', 'info@standrews.com', 'https://www.standrews.com', true),
  ('44444444-4444-4444-4444-444444444444', 'Torrey Pines Golf Course', '11480 N Torrey Pines Rd, La Jolla, CA 92037', '+1-858-452-3226', 'info@torreypinesgolfcourse.com', 'https://www.sandiego.gov/park-and-recreation/golf/torreypines', true),
  ('55555555-5555-5555-5555-555555555555', 'Whistling Straits', 'N8501 County Road LS, Sheboygan, WI 53083', '+1-920-565-6080', 'info@whistlingstraits.com', 'https://www.whistlingstraits.com', true),
  ('66666666-6666-6666-6666-666666666666', 'Pinehurst Resort', '1 Carolina Vista Dr, Pinehurst, NC 28374', '+1-855-235-8507', 'info@pinehurst.com', 'https://www.pinehurst.com', true),
  ('77777777-7777-7777-7777-777777777777', 'Bethpage Black', '99 Quaker Meeting House Rd, Farmingdale, NY 11735', '+1-516-249-0700', 'info@bethpageblack.com', 'https://www.bethpagegolf.com', true),
  ('88888888-8888-8888-8888-888888888888', 'TPC Sawgrass', '110 Championship Way, Ponte Vedra Beach, FL 32082', '+1-904-273-3230', 'info@tpcsawgrass.com', 'https://www.tpc.com/sawgrass', true),
  ('99999999-9999-9999-9999-999999999999', 'Kiawah Island Golf Resort', '1 Sanctuary Beach Dr, Kiawah Island, SC 29455', '+1-843-266-4670', 'info@kiawahresort.com', 'https://www.kiawahresort.com', true),
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Bandon Dunes Golf Resort', '57744 Round Lake Dr, Bandon, OR 97411', '+1-541-347-4380', 'info@bandondunesgolf.com', 'https://www.bandondunesgolf.com', true);