USE CompanyDB
GO

IF OBJECT_ID('dbo.sales_invoice_lines', 'U') IS NOT NULL
	DROP TABLE dbo.sales_invoice_lines
GO


CREATE TABLE dbo.sales_invoice_lines (
	invoice_id INT NOT NULL
		CONSTRAINT fk_sales_invoice_lines_invoice_id FOREIGN KEY  
		REFERENCES dbo.sales_invoice_headers (invoice_id),
	line_number INT NOT NULL,
	product_id INT NOT NULL
		CONSTRAINT fk_sales_invoice_lines_product_id FOREIGN KEY  
		REFERENCES dbo.products (product_id),
	quantity DECIMAL(10, 2) NULL,
	unit_price DECIMAL(16, 4) NULL,
	tax_rate DECIMAL(10, 8) NULL,
	CONSTRAINT pk_sales_invoice_lines
		PRIMARY KEY (invoice_id, line_number)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Primary table of the data set. Raw version, that
			includes fraudulent deviations, is built by R and
			stored in the BuilderDB. Journal entry data is
			derived from this data set.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'sales_invoice_lines';
