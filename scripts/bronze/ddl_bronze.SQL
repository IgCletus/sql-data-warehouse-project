


/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named "DWH" (DataWarehouse) after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas 
    within the database: 'bronze', 'silver', and 'gold'.*/

USE master;

/* Designing a High Level Data Architecture 
    Create the 'DataWarehouse' database */
CREATE DATABASE Datawarehouse;
USE Datawarehouse;


/*Now Let's create schema for each of the layers in our "Warehouse" 
(i.e, Bronze, Silver, and Gold later)
Create Schemas */

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;


/* Building the Bronze Layer
Let's first of all CREATE the "source_crm" DDL Tables FOR BRONZE */
IF OBJECT_ID ('bronze.crm_cust_info') IS NOT NULL
DROP TABLE bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key NVARCHAR(50),
    cst_firstname NVARCHAR(50),
    cst_lastname NVARCHAR(50),
    cst_marital_status NVARCHAR(50),
    cst_gndr NVARCHAR(50),
    cst_create_date DATE
    );

GO

IF OBJECT_ID ('bronze.crm_prd_info') IS NOT NULL
DROP TABLE bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
    );

GO

IF OBJECT_ID ('bronze.crm_sales_details') IS NOT NULL
DROP TABLE bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num NVARCHAR(50),
    sls_prd_key NVARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
    );


/* Building the Bronze Layer
Let's also CREATE the source_erp DDL Tables FOR BRONZE */
IF OBJECT_ID ('bronze.erp_cust_az12') IS NOT NULL
DROP TABLE bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    CID NVARCHAR(50),
    BDATE DATE,
    GEN NVARCHAR(50)
    );


IF OBJECT_ID ('bronze.erp_loc_a101') IS NOT NULL
DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
    CID NVARCHAR(50),
    CNTRY NVARCHAR(50)
    );


IF OBJECT_ID ('bronze.erp_px_cat_g1v2') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID NVARCHAR(50),
    CAT NVARCHAR(50),
    SUBCAT NVARCHAR(50),
    MAINTENANCE NVARCHAR(50)
    );

