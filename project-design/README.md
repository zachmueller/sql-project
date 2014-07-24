# Overview
 - _**Objective**_: teach students practical, hands-on SQL skills working with typical corporate-like data sets
 - Plan (project initialization):
  1. List minimum skills required to meet various levels of competence (map to grading scale)
  2. Define questions (tasks) students will be asked to answer using the data, leveraging those skills
  3. Build dummy corporate data set (for students to query against)
  4. Develop tutorials that walk through project tasks (though on separate dummy data set)
  5. Structure project (series of tasks) for students and a grading scheme for that project
 - Additionally, create tasks that compare SQL vs Excel for complex calculations
  - Example 1: "Join" tables in Excel (VLOOKUP) vs. JOIN in SQL
  - Example 2: Data set with >1M records (too big for Excel)
 - Accounting and Finance focus (in regards to the questions being asked)
  - Build two "tracks" (Accounting vs. Finance; possibly break Accounting into Audit vs. Tax)
  - Require questions from each but allow students to choose a focus for more complex queries
 - Decide upon an [open source license](http://choosealicense.com/) to use

---

## 1. Skills
### Required Skills
 - Read-only focus (SELECT)
 - Filtering data (WHERE)
 - Sorting data (ORDER BY)
 - Aggregating data (GROUP BY)
 - Simple calculations (+, -, *, /, etc.)
 - Applying business logic (CASE .. END)
 - Combining data sets (JOIN)

### Advanced Skills
 - Temporary Tables
 - Pivoting data
 - Data structure design
 - Performance/optimization

---

## 2. Questions
### Accounting (Audit)
 - Fraudulent journal entries
 - All journal entries impacting X account(s)

### Accounting (Tax)
 - Payroll taxes
 - Complex idea:
  - Separate database with state tax rules (apportionment), have student use CASE .. END to apply differnet rules to different states

### Finance
 - Depreciation allocation
 - Identify fully depreciated assets
 - Complex idea:
  - P&L by product, group, etc.

---

## 3. Data Set
### R to the Rescue...

---
