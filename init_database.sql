-- =============================================
-- Drop and Create Database in MySQL
-- =============================================

-- Drop the database if it exists
DROP DATABASE IF EXISTS DataWarehouseAnalytics;

-- Create a new database
CREATE DATABASE DataWarehouseAnalytics;

-- Use the new database
USE DataWarehouseAnalytics;

-- =============================================
-- Create Tables (Note: MySQL does not support schemas like SQL Server)
-- We'll prefix table names with `gold_` instead of using a schema
-- =============================================

-- dim_customers table
CREATE TABLE gold_dim_customers (
    customer_key INT,
    customer_id INT,
    customer_number VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    country VARCHAR(50),
    marital_status VARCHAR(50),
    gender VARCHAR(50),
    birthdate DATE,
    create_date DATE
);

-- dim_products table
CREATE TABLE gold_dim_products (
    product_key INT,
    product_id INT,
    product_number VARCHAR(50),
    product_name VARCHAR(50),
    category_id VARCHAR(50),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    maintenance VARCHAR(50),
    cost INT,
    product_line VARCHAR(50),
    start_date DATE
);

-- fact_sales table
CREATE TABLE gold_fact_sales (
    order_number VARCHAR(50),
    product_key INT,
    customer_key INT,
    order_date DATE,
    shipping_date DATE,
    due_date DATE,
    sales_amount INT,
    quantity TINYINT,
    price INT
);

-- =============================================
-- Load Data from CSV (MySQL bulk insert)
-- Make sure `secure_file_priv` is correctly set or disabled
-- =============================================

-- Truncate tables before loading
TRUNCATE TABLE gold_dim_customers;
TRUNCATE TABLE gold_dim_products;
TRUNCATE TABLE gold_fact_sales;

-- Load CSV data (adjust path based on OS and MySQL settings)
-- Make sure the file is accessible and `secure_file_priv` allows it

LOAD DATA INFILE 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.dim_customers.csv'
INTO TABLE gold_dim_customers
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.dim_products.csv'
INTO TABLE gold_dim_products
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/sql/sql-data-analytics-project/datasets/csv-files/gold.fact_sales.csv'
INTO TABLE gold_fact_sales
FIELDS TERMINATED BY ',' 
IGNORE 1 LINES;
