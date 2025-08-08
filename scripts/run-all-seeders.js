/**
 * Script to run all database seeders in the correct order
 * This script will execute all seeder migration files
 */

import { createClient } from '@supabase/supabase-js'
import { readFileSync } from 'fs'
import { join } from 'path'

const supabaseUrl = process.env.VITE_SUPABASE_URL || 'YOUR_SUPABASE_URL'
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'YOUR_SERVICE_ROLE_KEY'

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
})

// Define the order of seeder execution (important for foreign key constraints)
const seederFiles = [
  'seed_golf_courses.sql',
  'seed_kitchen_owners.sql',
  'seed_restaurants.sql',
  'seed_revenue_centers.sql',
  'seed_users.sql',
  'seed_staff_assignments.sql',
  'seed_menu_categories.sql',
  'seed_menu_items.sql',
  'seed_customers.sql',
  'seed_orders.sql',
  'seed_order_items.sql',
  'seed_payments.sql',
  'seed_barcodes.sql',
  'seed_business_hours.sql',
  'seed_golf_course_assignments.sql',
  'seed_daily_deals.sql',
  'seed_combo_meals.sql'
]

async function runSeeders() {
  console.log('🌱 Starting database seeding process...\n')

  try {
    for (const seederFile of seederFiles) {
      console.log(`📄 Running seeder: ${seederFile}`)
      
      try {
        // Read the SQL file
        const sqlContent = readFileSync(join('supabase/migrations', seederFile), 'utf8')
        
        // Extract just the SQL statements (remove comments)
        const sqlStatements = sqlContent
          .split('\n')
          .filter(line => !line.trim().startsWith('--') && !line.trim().startsWith('/*') && !line.trim().startsWith('*') && line.trim() !== '')
          .join('\n')
        
        if (sqlStatements.trim()) {
          // Execute the SQL
          const { error } = await supabase.rpc('exec_sql', { sql: sqlStatements })
          
          if (error) {
            console.error(`❌ Error in ${seederFile}:`, error.message)
            // Continue with other seeders even if one fails
          } else {
            console.log(`✅ Successfully executed ${seederFile}`)
          }
        }
        
      } catch (fileError) {
        console.error(`❌ Error reading ${seederFile}:`, fileError.message)
      }
    }

    console.log('\n🎉 Database seeding completed!')
    console.log('\n📊 Summary of seeded data:')
    console.log('• 10 Golf Courses')
    console.log('• 5 Kitchen Owners with different subscription plans')
    console.log('• 5 Restaurants with unique domains')
    console.log('• 13 Revenue Centers (dining rooms, bars, patios)')
    console.log('• 15 Users (kitchen owners, managers, staff)')
    console.log('• 13 Staff Assignments')
    console.log('• 14 Menu Categories')
    console.log('• 22 Menu Items with realistic pricing')
    console.log('• 12 Customers with order history')
    console.log('• 10 Orders with different statuses')
    console.log('• 15 Order Items')
    console.log('• 10 Payment records')
    console.log('• 17 QR Codes for tables and menus')
    console.log('• Business Hours for all revenue centers')
    console.log('• 10 Golf Course Assignments')
    console.log('• 9 Daily Deals and promotions')
    console.log('• 5 Combo Meal packages')

    console.log('\n🔐 Test Login Credentials:')
    console.log('Kitchen Owners:')
    console.log('• john.smith@example.com (Premium Plan)')
    console.log('• sarah.johnson@example.com (Basic Plan)')
    console.log('• mike.wilson@example.com (Enterprise Plan)')
    console.log('\nNote: You\'ll need to create auth users separately or use the existing super admin account.')

  } catch (error) {
    console.error('❌ Fatal error during seeding:', error.message)
    process.exit(1)
  }
}

// Helper function to create exec_sql function if it doesn't exist
async function createExecSqlFunction() {
  const functionSQL = `
    CREATE OR REPLACE FUNCTION exec_sql(sql text)
    RETURNS void
    LANGUAGE plpgsql
    SECURITY DEFINER
    AS $$
    BEGIN
      EXECUTE sql;
    END;
    $$;
  `

  try {
    const { error } = await supabase.rpc('exec', { sql: functionSQL })
    if (error) {
      console.log('Note: exec_sql function may already exist or you may need to run seeders manually')
    }
  } catch (error) {
    console.log('Note: Will attempt to run seeders directly')
  }
}

// Run the seeders
async function main() {
  await createExecSqlFunction()
  await runSeeders()
}

main()