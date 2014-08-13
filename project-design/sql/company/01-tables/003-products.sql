USE CompanyDB
GO

IF OBJECT_ID('dbo.products', 'U') IS NOT NULL
	DROP TABLE dbo.products
GO


CREATE TABLE dbo.products (
	product_id INT NOT NULL,
	product_name NVARCHAR(256) NULL,
	cost DECIMAL(16, 4) NULL,
	list_price DECIMAL(16, 4) NULL,
	CONSTRAINT pk_products
		PRIMARY KEY (product_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains list of all products offered by
			the company.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'products';
