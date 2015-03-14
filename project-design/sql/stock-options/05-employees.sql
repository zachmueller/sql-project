USE CompanyDB
GO

IF OBJECT_ID('dbo.employees', 'U') IS NOT NULL
	DROP TABLE dbo.employees
GO


CREATE TABLE dbo.employees (
	employee_id INT NOT NULL,
	first_name NVARCHAR(256) NOT NULL,
	last_name NVARCHAR(256) NOT NULL,
	hire_date DATE NOT NULL,
	department_code NCHAR(4) NOT NULL
		CONSTRAINT fk_employees_department_code FOREIGN KEY  
		REFERENCES dbo.departments (department_code),
	CONSTRAINT pk_employees
		PRIMARY KEY (employee_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains list of employees that work at the company.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2015-03-10
- version 1.0.1:
		Modification: Add hire date field, set fields to non-NULLable
		Author: Zach Mueller
		Date: 2015-03-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'employees';
