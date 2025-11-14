CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Ajay@123';
GO

CREATE DATABASE SCOPED CREDENTIAL ajaycred
WITH IDENTITY = 'Managed Identity';
GO

create external data source source_silver
with (
    location = 'https://ajayawdatalake.blob.core.windows.net/silver',
    credential = ajaycred
);
GO

create external data source source_gold
with (
    location = 'https://ajayawdatalake.blob.core.windows.net/gold',
    credential = ajaycred
);
GO

CREATE EXTERNAL FILE FORMAT Parquet_Format
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);
GO

/*-- HERE WE HAVE CREATED VIEWS ON TOP OF SILVER CONTAINER FILES NOW WE HAVE TO PUSH THIS DATA TO THE GOLD CONTAINER 
SUCH THAT WE GET EXTERNAL TABLES ON TOP OF THIS DATA USING ALREADY CREATED VIEWS*/

--CREATE EXTERNAL TABLE SALES:

CREATE EXTERNAL TABLE gold.etsales
with(
    location = 'ETSALES',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Sales;
GO

--select * from gold.etsales;

--CREATE EXTERNAL TABLE PRODUCT
CREATE EXTERNAL TABLE gold.etproduct
with(
    location = 'ETPRODUCT',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Product;
GO

--CREATE EXTERNAL TABLE PRODUCT_SUBCAT
CREATE EXTERNAL TABLE gold.etproduct_subcat
with(
    location = 'ETPRODUCT_SUBCAT',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Product_subcat;
GO

--CREATE EXTERNAL TABLE PRODUCT_CAT
CREATE EXTERNAL TABLE gold.etproductcat
with(
    location = 'ETPRODUCT_CAT',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Product_cat;
GO

--CREATE EXTERNAL TABLE RETURNS
CREATE EXTERNAL TABLE gold.etreturns
with(
    location = 'ETRETURNS',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Returns;
GO

--CREATE EXTERNAL TABLE TERRITORY
CREATE EXTERNAL TABLE gold.et_territory
with(
    location = 'ET_TERRITORY',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Territory;
GO

--CREATE EXTERNAL TABLE CUSTOMERS
CREATE EXTERNAL TABLE gold.etcustomers
with(
    location = 'ETCUSTOMER',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Customer;
GO

--CREATE EXTERNAL TABLE CALENDAR
CREATE EXTERNAL TABLE gold.etcalendar
with(
    location = 'ETCALENDAR',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = parquet_Format
)
AS SELECT * FROM gold.Calendar;
