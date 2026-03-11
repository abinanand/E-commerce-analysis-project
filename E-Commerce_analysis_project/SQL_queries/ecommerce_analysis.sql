CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

CREATE TABLE sales_data (
    Order_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Region VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Quantity INT,
    Sales DECIMAL(10,2),
    Cost DECIMAL(10,2),
    Profit DECIMAL(10,2),
    Order_Date DATE
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/ecommerce_sales_dataset.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM sales_data
LIMIT 10;

SELECT COUNT(*) AS total_orders
FROM sales_data;

SELECT SUM(Sales) AS total_revenue
FROM sales_data;

SELECT SUM(Profit) AS total_profit
FROM sales_data;

SELECT Region,
SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Region
ORDER BY total_sales DESC;

SELECT Region,
SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Region
ORDER BY total_profit DESC;

SELECT Category,
SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Category
ORDER BY total_sales DESC;

SELECT Category,
SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Category
ORDER BY total_profit DESC;

SELECT Product_Name,
SUM(Sales) AS revenue
FROM sales_data
GROUP BY Product_Name
ORDER BY revenue DESC
LIMIT 10;

SELECT Product_Name,
SUM(Profit) AS profit
FROM sales_data
GROUP BY Product_Name
ORDER BY profit DESC
LIMIT 10;

SELECT Customer_ID,
SUM(Sales) AS total_spent
FROM sales_data
GROUP BY Customer_ID
ORDER BY total_spent DESC
LIMIT 10;

SELECT 
MONTH(Order_Date) AS month,
SUM(Sales) AS revenue
FROM sales_data
GROUP BY month
ORDER BY month;

SELECT 
YEAR(Order_Date) AS year,
SUM(Sales) AS revenue
FROM sales_data
GROUP BY year;

SELECT Region,
Category,
SUM(Sales) AS revenue
FROM sales_data
GROUP BY Region, Category
ORDER BY Region;

SELECT AVG(Sales) AS avg_order_value
FROM sales_data;

SELECT Product_Name,
SUM(Sales) AS total_sales,
RANK() OVER (ORDER BY SUM(Sales) DESC) AS sales_rank
FROM sales_data
GROUP BY Product_Name;

SELECT Product_Name,
SUM(Profit)/SUM(Sales)*100 AS profit_margin
FROM sales_data
GROUP BY Product_Name
ORDER BY profit_margin DESC;

CREATE VIEW sales_summary AS
SELECT
Region,
Category,
SUM(Sales) AS total_sales,
SUM(Profit) AS total_profit
FROM sales_data
GROUP BY Region, Category;

SELECT * FROM sales_summary;