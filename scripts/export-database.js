/**
 * Script to export database data for importing into another database
 * This creates SQL dump files that can be imported elsewhere
 */

import { createClient } from '@supabase/supabase-js'
import { writeFileSync, mkdirSync } from 'fs'
import { join } from 'path'

const supabaseUrl = process.env.VITE_SUPABASE_URL || 'YOUR_SUPABASE_URL'
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY || 'YOUR_SERVICE_ROLE_KEY'

const supabase = createClient(supabaseUrl, supabaseServiceKey, {
  auth: {
    autoRefreshToken: false,
    persistSession: false
  }
})

// Tables to export in dependency order
const tables = [
  'golf_courses',
  'kitchen_owners',
  'restaurants',
  'revenue_centers',
  'users',
  'staff_assignments',
  'menu_categories',
  'menu_items',
  'combo_meals',
  'customers',
  'orders',
  'order_items',
  'payments',
  'barcodes',
  'business_hours',
  'kitchen_golf_course_assignments',
  'daily_deals'
]

function formatValue(value: any): string {
  if (value === null || value === undefined) {
    return 'NULL'
  }
  
  if (typeof value === 'string') {
    return `'${value.replace(/'/g, "''")}'`
  }
  
  if (typeof value === 'boolean') {
    return value ? 'TRUE' : 'FALSE'
  }
  
  if (typeof value === 'object') {
    return `'${JSON.stringify(value).replace(/'/g, "''")}'`
  }
  
  return String(value)
}

function generateInsertStatement(tableName: string, rows: any[]): string {
  if (!rows || rows.length === 0) {
    return `-- No data found for table: ${tableName}\n`
  }

  const columns = Object.keys(rows[0])
  const columnList = columns.join(', ')
  
  let sql = `-- Insert data for ${tableName}\n`
  sql += `INSERT INTO ${tableName} (${columnList}) VALUES\n`
  
  const valueRows = rows.map(row => {
    const values = columns.map(col => formatValue(row[col])).join(', ')
    return `  (${values})`
  })
  
  sql += valueRows.join(',\n')
  sql += ';\n\n'
  
  return sql
}

async function exportTable(tableName: string): Promise<string> {
  try {
    console.log(`📄 Exporting ${tableName}...`)
    
    const { data, error } = await supabase
      .from(tableName)
      .select('*')
      .order('created_at', { ascending: true })

    if (error) {
      console.error(`❌ Error exporting ${tableName}:`, error.message)
      return `-- Error exporting ${tableName}: ${error.message}\n\n`
    }

    return generateInsertStatement(tableName, data || [])
    
  } catch (error) {
    console.error(`❌ Unexpected error exporting ${tableName}:`, error)
    return `-- Unexpected error exporting ${tableName}\n\n`
  }
}

async function exportDatabase() {
  console.log('📦 Starting database export...\n')

  try {
    // Create exports directory
    const exportDir = 'database-exports'
    mkdirSync(exportDir, { recursive: true })

    let fullExport = `-- Kitchen POS Database Export
-- Generated on: ${new Date().toISOString()}
-- 
-- This file contains all the data from the Kitchen POS database
-- Import this into another Supabase project after setting up the schema
--
-- IMPORTANT: Make sure to run the schema migrations first before importing this data
--

SET session_replication_role = replica; -- Disable triggers during import

`

    // Export each table
    for (const tableName of tables) {
      const tableExport = await exportTable(tableName)
      fullExport += tableExport
      
      // Also create individual table export
      const individualExport = `-- ${tableName} table export
-- Generated on: ${new Date().toISOString()}

${tableExport}`
      
      writeFileSync(join(exportDir, `${tableName}.sql`), individualExport)
    }

    fullExport += `
SET session_replication_role = DEFAULT; -- Re-enable triggers

-- Export completed successfully
-- Total tables exported: ${tables.length}
`

    // Write full export file
    writeFileSync(join(exportDir, 'full-database-export.sql'), fullExport)

    // Create import instructions
    const instructions = `# Database Import Instructions

## Files Generated

1. **full-database-export.sql** - Complete database dump with all tables
2. **Individual table files** - Separate SQL files for each table

## How to Import

### Option 1: Import Full Database
\`\`\`sql
-- Run this in your target database's SQL editor
-- Make sure schema migrations are applied first
\\i full-database-export.sql
\`\`\`

### Option 2: Import Individual Tables
Import tables in this order to respect foreign key constraints:

${tables.map((table, index) => `${index + 1}. ${table}.sql`).join('\n')}

### Option 3: Using Supabase Dashboard
1. Go to your target Supabase project
2. Navigate to SQL Editor
3. Copy and paste the contents of full-database-export.sql
4. Execute the query

## Important Notes

- Make sure your target database has the same schema (run migrations first)
- The export includes UUIDs, so there shouldn't be ID conflicts
- All foreign key relationships are preserved
- Triggers are temporarily disabled during import for better performance

## Test Data Included

- 10 Golf Courses
- 5 Kitchen Owners with subscriptions
- 5 Restaurants with different configurations
- 13 Revenue Centers
- 15 Users (owners, managers, staff)
- 22 Menu Items across 14 categories
- 12 Customers with order history
- 10 Orders with various statuses
- Payment records and QR codes
- Business hours and promotional deals

## Credentials for Testing

Kitchen Owner Accounts (you'll need to create auth users):
- john.smith@example.com (Premium Plan)
- sarah.johnson@example.com (Basic Plan)  
- mike.wilson@example.com (Enterprise Plan)

Use the existing super admin account for full access:
- admin@kitchenpos.com / SuperAdmin123!
`

    writeFileSync(join(exportDir, 'README.md'), instructions)

    console.log('\n✅ Database export completed successfully!')
    console.log(`📁 Files saved to: ${exportDir}/`)
    console.log('\nGenerated files:')
    console.log('• full-database-export.sql (complete database)')
    console.log('• Individual table SQL files')
    console.log('• README.md (import instructions)')
    
    console.log('\n📋 To import into another database:')
    console.log('1. Apply schema migrations first')
    console.log('2. Run the full-database-export.sql file')
    console.log('3. Create auth users for kitchen owners if needed')

  } catch (error) {
    console.error('❌ Export failed:', error.message)
    process.exit(1)
  }
}

// Run the export
exportDatabase()