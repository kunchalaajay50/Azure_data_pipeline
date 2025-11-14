CREATE OR ALTER VIEW gold.Calendar AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Calendar/',
            FORMAT = 'PARQUET'
) as query_1
GO

CREATE OR ALTER VIEW gold.Customer AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Customer/',
            FORMAT = 'PARQUET'
) as query_2
GO

CREATE OR ALTER VIEW gold.Product AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Product/',
            FORMAT = 'PARQUET'
) as query_3
GO

CREATE OR ALTER VIEW gold.Product_subcat AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Product_subcat/',
            FORMAT = 'PARQUET'
) as query_4
GO

CREATE OR ALTER VIEW gold.Product_cat AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Productcat/',
            FORMAT = 'PARQUET'
) as query_5
GO

CREATE OR ALTER VIEW gold.Returns AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Returns/',
            FORMAT = 'PARQUET'
) as query_6
GO

CREATE OR ALTER VIEW gold.Sales AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Sales/',
            FORMAT = 'PARQUET'
) as query_7
GO

CREATE OR ALTER VIEW gold.Territory AS
SELECT * 
FROM
OPENROWSET(
            BULK 'https://ajayawdatalake.blob.core.windows.net/silver/Territory/',
            FORMAT = 'PARQUET'
) as query_8