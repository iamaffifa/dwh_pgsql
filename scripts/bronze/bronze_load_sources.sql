/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` "COPY" command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    
===============================================================================
*/


CREATE OR REPLACE PROCEDURE bronze.bronze_load_data()
LANGUAGE plpgsql
AS $$
    DECLARE start_time TIMESTAMP;
    DECLARE end_time TIMESTAMP;
    DECLARE batch_start_time TIMESTAMP;
    DECLARE batch_end_time TIMESTAMP;
BEGIN
    batch_start_time := clock_timestamp();
    RAISE NOTICE '--- Starting Loading ---';
    RAISE NOTICE '--- Loading CRM ---';
    
    start_time := clock_timestamp();
    RAISE NOTICE '--- Truncate TABLE bronze.crm_cust_info ---';
    TRUNCATE TABLE bronze.crm_cust_info;
    RAISE NOTICE '--- Insertig data into bronze.crm_cust_info ---';
    COPY bronze.crm_cust_info
    FROM 'E:\Data Engineering\dwh_pgsql\datasets\source_crm\cust_info.csv'
    WITH (FORMAT CSV, HEADER, DELIMITER ',');
    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: %', start_time - end_time;

    start_time := clock_timestamp();
    RAISE NOTICE '--- Truncate TABLE bronze.crm_prd_info ---';
    TRUNCATE TABLE bronze.crm_prd_info;
    RAISE NOTICE '--- Insertig data into bronze.crm_prd_info ---';
    COPY bronze.crm_prd_info
    FROM 'E:\Data Engineering\dwh_pgsql\datasets\source_crm\prd_info.csv'
    WITH (FORMAT CSV, HEADER, DELIMITER ',');
    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: %', start_time - end_time;

    start_time := clock_timestamp();
    RAISE NOTICE '--- Truncate TABLE bronze.crm_sales_details ---';
    TRUNCATE TABLE bronze.crm_sales_details;
    RAISE NOTICE '--- Insertig data into bronze.crm_sales_details ---';
    COPY bronze.crm_sales_details
    FROM 'E:\Data Engineering\dwh_pgsql\datasets\source_crm\sales_details.csv'
    WITH (FORMAT CSV, HEADER, DELIMITER ',');
    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: %', start_time - end_time;

    RAISE NOTICE '--- Loading ERP ---';
    start_time := clock_timestamp();
    RAISE NOTICE '--- Truncate TABLE bronze.erp_cust_az12 ---';
    TRUNCATE TABLE bronze.erp_cust_az12;
    RAISE NOTICE '--- Insertig data into bronze.erp_cust_az12 ---';
    COPY bronze.erp_cust_az12
    FROM 'E:\Data Engineering\dwh_pgsql\datasets\source_erp\cust_az12.csv'
    WITH (FORMAT CSV, HEADER, DELIMITER ',');
    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: %', start_time - end_time;


    start_time := clock_timestamp();
    RAISE NOTICE '--- Truncate TABLE bronze.erp_loc_a101 ---';
    TRUNCATE TABLE bronze.erp_loc_a101;
    RAISE NOTICE '--- Insertig data into bronze.erp_loc_a101 ---';
    COPY bronze.erp_loc_a101
    FROM 'E:\Data Engineering\dwh_pgsql\datasets\source_erp\loc_a101.csv'
    WITH (FORMAT CSV, HEADER, DELIMITER ',');
    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: %', start_time - end_time;

    start_time := clock_timestamp();
    RAISE NOTICE '--- Truncate TABLE bronze.erp_px_cat_g1v2 ---';
    TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    RAISE NOTICE '--- Insertig data into bronze.erp_px_cat_g1v2 ---';
    COPY bronze.erp_px_cat_g1v2
    FROM 'E:\Data Engineering\dwh_pgsql\datasets\source_erp\px_cat_g1v2.csv'
    WITH (FORMAT CSV, HEADER, DELIMITER ',');
    end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: %', start_time - end_time;

    batch_end_time := clock_timestamp();
    RAISE NOTICE 'Load Duration: %', batch_start_time - batch_end_time;

END 
$$;

