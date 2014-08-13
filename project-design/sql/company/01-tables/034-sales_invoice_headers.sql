USE CompanyDB
GO

IF OBJECT_ID('dbo.sales_invoice_headers', 'U') IS NOT NULL
	DROP TABLE dbo.sales_invoice_headers
GO


CREATE TABLE dbo.sales_invoice_headers (
	invoice_id INT NOT NULL,
	invoice_date DATE NULL,
	customer_id INT NOT NULL
		CONSTRAINT fk_sales_invoice_headers_customer_id FOREIGN KEY  
		REFERENCES dbo.customers (customer_id),
	sales_employee_id INT NOT NULL
		CONSTRAINT fk_sales_invoice_headers_sales_employee_id FOREIGN KEY  
		REFERENCES dbo.employees (employee_id),
	CONSTRAINT pk_sales_invoice_headers
		PRIMARY KEY (invoice_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Header detail for the invoice data.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'sales_invoice_headers';
