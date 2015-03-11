USE CompanyDB
GO

IF OBJECT_ID('dbo.stock_options', 'U') IS NOT NULL
	DROP TABLE dbo.stock_options
GO


CREATE TABLE dbo.stock_options (
	stock_option_id INT NOT NULL,
	employee_id INT NOT NULL
		CONSTRAINT fk_stock_options_employee_id FOREIGN KEY  
		REFERENCES dbo.employees (employee_id),
	share_count DECIMAL(16, 4) NOT NULL,
	grant_date DATE NOT NULL,
	grant_price DECIMAL(16, 10) NULL,
	CONSTRAINT pk_stock_options
		PRIMARY KEY (stock_option_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains stock options granted to
			employees of the company with the option
			grant date and grant price.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2015-03-10
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'stock_options';
