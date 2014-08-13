# Database schema

## Data set focus
 - Revenue/Sales data
 - Start with invoices, build up from there
 - Build schema with only the necessary fields, will add complexity as design progresses

## Simplifying assumptions
 - US only (single currency)
 - One "store" location
 - Cash sales only (no storing credit card data, no receivables)
 - No shipping (purchasing or sales)
 - No discounts on sales
 - No returns
 - Flat cost of sales (per product)

## Core tables
 - Employees
 - Customers
 - Products
 - Sales Invoices
 - Journal Entries

## Databases
 - *BuilderDB*: Used by the R script during the data set building process to store all raw data, including flags and amounts of fraudulent activity. Not accessible to students.
 - *CompanyDB*: Stores the final data set in a typical corporate structure. Directly referenced by the students for accomplishing project tasks.

---

## Employees
 - Table: `dbo.employees`
 - Fields:
  - `employee_id`
  - `first_name`
  - `last_name`
  - `email_address`
  - `phone_number`
  - `department_name`
 - Purpose: Contains list of employees that work at the company. Only employees relevant to the project queries will be created, i.e., sales employees, accounts receivable employees, etc. Employees that will participate in fraudulent activity will be flagged as such in the BuilderDB.

## Customers
 - Table: `dbo.customers`
 - Fields:
  - `customer_id`
  - `first_name`
  - `last_name`
  - `email_address`
  - `phone_number`
  - `address_line1`
  - `address_line2`
  - `city_name`
  - `state_abbreviation`
  - `postal_code`
 - Purpose: Contains list of customers of the company. Behind-the-scenes customer attributes, such as purchasing growth rate, will be stored in the BuilderDB.

## Products
 - Table: `dbo.products`
 - Fields:
  - `product_id`
  - `product_name`
  - `cost`
  - `list_price`
 - Purpose: Contains list of all products offered by the company.

## Sales Invoices (Headers)
 - Table: `dbo.sales_invoice_headers`
 - Fields:
  - `invoice_id`
  - `invoice_date`
  - `customer_id`
  - ``
 - Purpose: Header detail for the invoice data.

## Sales Invoices (Lines)
 - Table: `dbo.sales_invoice_lines`
 - Fields:
  - `invoice_id`
  - `line_number`
  - `product_id`
  - `quantity`
  - `unit_price`
  - `tax_rate`
  - ``
 - Purpose: Primary table of the data set. Raw version, that includes fraudulent deviations, is built by R and stored in the BuilderDB. Journal entry data is derived from this data set.

## Journal Entries (Headers)
 - Table: `dbo.je_headers`
 - Fields:
  - `je_header_id`
  - `date_posted`
  - `created_by_employee_id`
  - `created_date`
  - ``
 - Purpose: Contains all journal entries relevant to the project tasks. Will be built based upon the raw sales invoices data from the BuilderDB.
 - Accounts to be hit in sales process: Revenue, Cost of Goods Sold, Inventory, Cash (no A/R for now), Taxes Payable

## Journal Entries (Lines)
 - Table: `dbo.je_lines`
 - Fields:
  - `je_header_id`
  - `line_number`
  - `company_code`
  - `department_code`
  - `location_code`
  - `account_code`
  - `accounted_dr`
  - `accounted_cr`
  - ``
 - Purpose: Contains all journal entry lines relevant to the project tasks. Will be built based upon the raw sales invoices data from the BuilderDB.
