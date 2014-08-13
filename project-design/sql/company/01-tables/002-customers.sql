USE CompanyDB
GO

IF OBJECT_ID('dbo.customers', 'U') IS NOT NULL
	DROP TABLE dbo.customers
GO


CREATE TABLE dbo.customers (
	customer_id INT NOT NULL,
	first_name NVARCHAR(256) NULL,
	last_name NVARCHAR(256) NULL,
	email_address NVARCHAR(256) NULL,
	phone_number NVARCHAR(256) NULL,
	address_line1 NVARCHAR(256) NULL,
	address_line2 NVARCHAR(256) NULL,
	city_name NVARCHAR(256) NULL,
	state_abbreviation NVARCHAR(256) NULL,
	postal_code NVARCHAR(256) NULL,
	CONSTRAINT pk_customers
		PRIMARY KEY (customer_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains list of customers of the company.
			Behind-the-scenes customer attributes, such
			as purchasing growth rate, will be stored in
			the BuilderDB.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'customers';
