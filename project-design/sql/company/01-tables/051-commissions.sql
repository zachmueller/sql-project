USE CompanyDB
GO

IF OBJECT_ID('dbo.commissions', 'U') IS NOT NULL
	DROP TABLE dbo.commissions
GO


CREATE TABLE dbo.commissions (
	invoice_id INT NOT NULL
		CONSTRAINT fk_commissions_invoice_id FOREIGN KEY  
		REFERENCES dbo.sales_invoice_headers (invoice_id),
	employee_id INT NOT NULL
		CONSTRAINT fk_commissions_employee_id FOREIGN KEY  
		REFERENCES dbo.employees (employee_id),
	commission_phase NVARCHAR(15) NOT NULL,
	commission_amount DECIMAL(16, 4) NULL,
	payment_status BIT NOT NULL DEFAULT 0,
	
	created_date DATETIME2 NOT NULL,
	updated_date DATETIME2 NOT NULL,
	CONSTRAINT pk_commissions
		PRIMARY KEY (invoice_id, employee_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Tracks all commissions for product sales.
			Each sale triggers three new records, one
			for each commission payout phase.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-16
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'commissions';
