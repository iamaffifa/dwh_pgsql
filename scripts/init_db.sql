/*
==========================================
Creating Database and Schemas 
==========================================

Script Purpose:
Create database with name "dwh_pgsql" and schemas

Script Warning
None
*/

-- Creating the database

CREATE DATABASE dwh_pgsql
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- Creating Schema
CREATE SCHEMA bronze;
CREATE SCHEMA bronze;
CREATE SCHEMA bronze;