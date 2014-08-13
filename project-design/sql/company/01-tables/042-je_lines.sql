USE CompanyDB
GO

IF OBJECT_ID('dbo.je_lines', 'U') IS NOT NULL
	DROP TABLE dbo.je_lines
GO


CREATE TABLE dbo.je_lines (
	je_header_id INT NOT NULL
		CONSTRAINT fk_je_lines_je_header_id FOREIGN KEY  
		REFERENCES dbo.je_headers (je_header_id),
	line_number INT NOT NULL,
	company_code NCHAR(3) NOT NULL,
	department_code NCHAR(4) NOT NULL,
	location_code NCHAR(3) NOT NULL,
	account_code NCHAR(6) NOT NULL,
	accounted_dr DECIMAL(16, 4) NULL,
	accounted_cr DECIMAL(16, 4) NULL,
	CONSTRAINT pk_je_lines
		PRIMARY KEY (je_header_id, line_number)
)
GO


EXEC sys.sp_addextendedproperty @name = N'Documentation'
	,@value = N'
summary:	>
			Contains all journal entry lines relevant to
			the project tasks. Will be built based upon
			the raw sales invoices data from the BuilderDB.
Revisions:
- version 1:
		Modification: Initial design
		Author: Zach Mueller
		Date: 2014-08-13
'
	,@level0type = N'SCHEMA'
	,@level0name = N'dbo'
	,@level1type = N'TABLE'
	,@level1name = N'je_lines';
