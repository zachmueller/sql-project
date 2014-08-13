USE CompanyDB
GO

IF OBJECT_ID('dbo.je_headers', 'U') IS NOT NULL
	DROP TABLE dbo.je_headers
GO


CREATE TABLE dbo.je_headers (
	je_header_id INT NOT NULL,
	date_posted DATETIME2 NOT NULL,
	created_by_employee_id INT NOT NULL
		CONSTRAINT fk_je_headers_created_by_employee_id FOREIGN KEY  
		REFERENCES dbo.employees (employee_id),
	created_date DATETIME2 NULL,
	CONSTRAINT pk_je_headers
		PRIMARY KEY (je_header_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains all journal entries relevant to the
			project tasks. Will be built based upon the
			raw sales invoices data from the BuilderDB.
			Some accounts to be hit in sales process include
			Revenue, Cost of Goods Sold, Inventory,
			Cash (no A/R for now), Taxes Payable.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'je_headers';
