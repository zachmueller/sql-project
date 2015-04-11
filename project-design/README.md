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
 - System setup plans can be found [here](server-specs.md)
 - Will be hosted at [sql-project.com](http://sql-project.com) once completed
  - SQL Server accessible via sql.sql-project.com, ask for login details (currently offline)

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
### Stock Options
 - Focus on valuation of stock options outstanding at various points in time for the company
 - Project write-up will include info on NOL carryforward and questions around how the stock options impact the company's valuation

### Fixed Assets
 - Compare the Tax vs Book valuation of the company's fixed assets
 - Investigate whether any fraud or errors exist in the asset data
 - Calculate expected GAAP Accounting impact if some assets were to be sold

---

## 3. Data Set
### R to the Rescue...
 - Design database table structure first, ensuring it suits the Questions/Tasks very well
 - R script to create dummy data
 - Include functionality to purposefully create fraudulent activity, broken accounting processes, etc.
  - Use R to generate accounting detail material (Excel spreadsheets) as backup for journal entries, ensuring some are different from what's in the database

### Data Set Focus
 - Stock Options
  - Table tracking all stock option grants
  - Table tracking all transactions of the stock options (exercises, expirations, etc.)
  - Include a separate table with the daily stock price over the life of the company
 - Fixed Assets
  - Basic asset-related data, to include cost, purchase date, type, sales/retirements, etc.
  - Incorporate fraud or errors on data entry for some assets

---

## 4. Tutorials
### Set up blog on website
 - Will host website on [Squarespace](http://www.squarespace.com/)
 - Hosted at [sql-project.com](http://sql-project.com)

---

## 5. Project
### Tasks
 - Any practice problems from the tutorials (not required for project grade, possibly required as homework?)
 - A few "Easy" problems from each focus (Accounting, Finance, etc.)
 - Choose from any focus for "Medium" and "Hard" problems
 - Number of problems:
  - Easy: 3-5
  - Medium: 5-7
  - Hard: 2-3
  - Total: 10-15

---
