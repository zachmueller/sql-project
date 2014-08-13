USE CompanyDB
GO

IF OBJECT_ID('dbo.employees', 'U') IS NOT NULL
	DROP TABLE dbo.employees
GO


CREATE TABLE dbo.employees (
	employee_id INT NOT NULL,
	first_name NVARCHAR(256) NULL,
	last_name NVARCHAR(256) NULL,
	email_address NVARCHAR(256) NULL,
	phone_number NVARCHAR(256) NULL,
	department_name NVARCHAR(256) NULL,
	CONSTRAINT pk_employees 
		PRIMARY KEY (employee_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains list of employees that work at the company. 
			Only employees relevant to the project queries will
			be created, i.e., sales employees, accounts receivable
			employees, etc. Employees that will participate in
			fraudulent activity will be flagged as such in the
			BuilderDB.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'employees';
