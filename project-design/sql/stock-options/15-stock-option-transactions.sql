USE CompanyDB
GO

IF OBJECT_ID('dbo.stock_option_transactions', 'U') IS NOT NULL
	DROP TABLE dbo.stock_option_transactions
GO


CREATE TABLE dbo.stock_option_transactions (
	stock_option_transaction_id INT NOT NULL,
	stock_option_id INT NOT NULL
		CONSTRAINT fk_stock_option_transactions_stock_option_id FOREIGN KEY  
		REFERENCES dbo.stock_options (stock_option_id),
	transaction_type NVARCHAR(256) NOT NULL,
	transaction_date DATE NOT NULL,
	share_count DECIMAL(16, 4) NOT NULL,
	transaction_price DECIMAL(16, 10) NULL,
	CONSTRAINT pk_stock_options
		PRIMARY KEY (stock_option_transaction_id)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains all transactions that occur for
			the stock options that have been granted,
			e.g., Exercised, Expired, etc.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2015-03-10
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'stock_option_transactions';
