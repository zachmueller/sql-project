# Overview
 - _**Objective**_: teach students practical, hands-on SQL skills working with typical corporate-like data sets
 - Plan (project initialization):
  1. List minimum skills required to meet various levels of competence (map to grading scale)
  2. Define questions (tasks) students will be asked to answer using the data, leveraging those skills
  3. Build dummy corporate data set (for students to query against)
  4. Develop tutorials that walk through project tasks (though on separate dummy data set)
  5. Structure project (series of tasks) for students and a grading scheme for that project
 - Additionally, create tasks that compare SQL vs. Excel for complex calculations
  - Example 1: "Join" tables in Excel (VLOOKUP) vs. JOIN in SQL
  - Example 2: Data set with >1M records (too big for Excel)
  - Example 3: Summarizing monthly report Excel files vs. single SQL table
 - Accounting and Finance focus (in regards to the questions being asked)
  - Build two "tracks" (Accounting vs. Finance; possibly break Accounting into Audit vs. Tax)
  - Require questions from each but allow students to choose a focus for more complex queries
 - Decide upon an [open source license](http://choosealicense.com/) to use
 - System setup plans can be found [here](server-specs.md)
 - Will be hosted at [sql-project.com](http://sql-project.com) once completed
  - SQL Server accessible via sql.sql-project.com, ask for login details

---

## 1. Skills
### Required Skills
 - Read-only focus (SELECT)
 - Filtering data (WHERE)
 - Sorting data (ORDER BY)
 - Aggregating data (GROUP BY)
 - Simple calculations (+, -, *, /, etc.)
 - Combining data sets (JOIN)
 - Applying business logic (CASE .. END)
 - Others (DISTINCT, TOP, UNION)

### Intermediate Skills
 - Understanding data types
 - Subqueries
 - Linking Excel to databases
 - Temporary Tables

### Advanced Skills
 - Pivoting data
 - Data structure/design
 - Performance/optimization
 - Procedural SQL
 - Dynamic SQL

---

## 2. Questions
### Accounting (General)
 - Apply different costing methods
 - Create depreciation schedules

### Accounting (Audit)
 - Fraudulent journal entries
 - All journal entries impacting X account(s)
 - Non-compliant processes or accounting practices
 - Identify duplicate records

### Accounting (Tax)
 - Payroll taxes
 - International taxes (VAT, GST, etc.)
 - Complex idea:
  - Separate database with state tax rules (apportionment), have student use CASE .. END to apply rules varying by states

### Finance
 - Depreciation allocation
 - Identify fully depreciated assets
 - Largest supplier/vendor
 - Complex ideas:
  - P&L by product, group, etc.
  - Most costly/profitable customer, product, etc.

---

## 3. Data Set
### R to the Rescue...
 - Design database table structure first, ensuring it suits the Questions/Tasks very well
 - R script to create dummy data
 - Include functionality to purposefully create fraudulent activity, broken accounting processes, etc.
  - Use R to generate accounting detail material (Excel spreadsheets) as backup for journal entries, ensuring some are different from what's in the database

### Data Set Focus
 - Revenue/Sales focus
  - $X in sales, how to get comfortable with its accuracy
  - Start with invoices and build supporting documents and JEs from there
  - Can incorporate fraudulent invoices easily
  - Monthly sales reports in Excel files (compare workability against single SQL table)

---

## 4. Tutorials
### Set up blog on website
 - Likely use [ghost](https://ghost.org/) blogging software

---

## 5. Project
### Tasks
 - Any "practice problems" from the tutorials
 - A few "easy" problems from each focus (Accounting, Finance, etc.)

---
