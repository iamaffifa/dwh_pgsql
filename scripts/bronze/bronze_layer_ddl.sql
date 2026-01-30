/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================

=========================================
Data Source CRM 
=========================================
*/

-- cust Table
DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
    cst_id INT, 
    cst_key	VARCHAR,
    cst_firstname VARCHAR,
    cst_lastname VARCHAR,
    cst_marital_status VARCHAR,
    cst_gndr VARCHAR,
    cst_create_date DATE
);

-- prd Table
DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id	INT,
    prd_key	VARCHAR (100),
    prd_nm	VARCHAR,
    prd_cost INT,
    prd_line VARCHAR,
    prd_start_dt DATE,
    prd_end_dt DATE
);

-- Sales Table
DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num	VARCHAR,
    sls_prd_key	VARCHAR,
    sls_cust_id	INT,
    sls_order_dt INT,
    sls_ship_dt	INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,	
    sls_price INT
);

-- For sls_ship_dt, sls_due_dt and sls_order_dt we use INTEGER because the dates are not in the tadard date format.
/*
=========================================
Data Source ERP 
=========================================
*/
-- cust_az12 table
DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50)
);

-- loc_a101 table
DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50)
);

-- px_cat_g1v2 table
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subcat VARCHAR(50),
    maintenance VARCHAR(50)
)