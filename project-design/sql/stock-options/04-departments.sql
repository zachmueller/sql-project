USE CompanyDB
GO

IF OBJECT_ID('dbo.departments', 'U') IS NOT NULL
	DROP TABLE dbo.departments
GO


CREATE TABLE dbo.departments (
	department_code NCHAR(4) NOT NULL,
	department_name NVARCHAR(256) NULL,
	CONSTRAINT pk_departments
		PRIMARY KEY (department_code)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains list of departments of the company.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2015-03-10
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'departments';
