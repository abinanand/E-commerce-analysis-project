# E-Commerce Sales Analytics Project

## Overview
This project analyzes an e-commerce sales dataset to extract insights about revenue, product performance, and customer behavior.

## Tools Used
- Python (Pandas)
- SQL
- Seaborn / Matplotlib
- Power BI

## Dataset
The dataset contains:
- Order ID
- Customer ID
- Region
- Product
- Sales
- Profit
- Order Date

## Project Workflow
1. Data Cleaning using Python
2. Data Analysis using SQL
3. Data Visualization using Python
4. Dashboard creation in Power BI

## Key Insights
- Technology category generates highest revenue
- West region contributes highest sales
- Top products generate major revenue

## SQL Queries
Example query:

```sql
SELECT Region, SUM(Sales)
FROM sales_data
GROUP BY Region;
