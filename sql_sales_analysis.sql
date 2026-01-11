-- Create a database for storing a sales cleaned data.

CREATE DATABASE saleanalysis;
USE saleanalysis;

--The cleaned CSV file was loaded using SQL Server Import Wizard.
/* so we created a database to store our sales cleaned data file.-->
   Now write some kpi's to analyze from dataset to understand bussiness growth */

/*
1?. Total Revenue
2?. Total Units Sold
3. Average Order Value (AOV)
4. Monthly Sales Trend
5. Best & Worst Sales Day

*PRODUCT & CATEGORY KPI's
6. Category-wise Revenue
7. Category-wise Quantity Sold
8. Top 10 Products by Revenue
9. Product Contribution %

* CUSTOMER EXPERIENCE KPI's
10. Category-wise Average Rating
11. High Revenue but Low Rating Products
12. Rating vs Revenue

*REMARKS & QUALITY KPIs
13. Remarks Distribution1
14. Complaint Rate
15. Remarks vs Average Rating
16. Revenue per Unit
17. Peak Sales Month
*/

  -- Convert column datatype from 'tinyint' or'smallint' to int first.
  ALTER TABLE cleaned_data
  ALTER COLUMN quantity INT;

  ALTER TABLE cleaned_data
  ALTER COLUMN unit_price INT;

-- Analyze all the above kpi's to understand the sales pattern--
-- 1. Toatal Revenue
-- This kpi show overall bussiness revenue genrated from all sales.

SELECT 
  SUM(quantity*unit_price) AS Total_Revenue
FROM cleaned_data;

--2. Total units sold
-- This kpi show the number of unit sold from all the sales.

SELECT 
  SUM(quantity) AS Total_Units_Sold
FROM cleaned_data;

--3. Total units sold by each product and category.
-- This kpi show the number of sold quantity by each product and category.

SELECT 
  product_name,
  category,
  SUM(quantity) AS Unit_Sold
FROM cleaned_data
GROUP BY  product_name,category;

-- 4. Monthly sales trend.
-- This kpi show the toatl sales in diffrent month.

SELECT 
    FORMAT(sale_date, 'yyyy-MM') AS sale_month,
    SUM(quantity * unit_price) AS monthly_revenue
FROM cleaned_data
GROUP BY FORMAT(sale_date, 'yyyy-MM')
ORDER BY sale_month;

--5. Category wise revenue.
-- This kpi show the total genreted sales revenue by each catogory.

SELECT
    category,product_name,
    SUM(quantity*unit_price) AS category_revenue
FROM cleaned_data
GROUP BY category,product_name;

--7. Category-wise Quantity Sold
-- This kpi show the top category product that sales largest number of product.

SELECT
  category,
  SUM(quantity) AS Total_quantity_sold
FROM cleaned_data
GROUP BY category
ORDER BY Total_quantity_sold DESC;

--8. Top 3 Products by Revenue.
-- This show the top 3 products that genrate most of revenus in overall sales.

SELECT TOP 3 
  product_name, 
  SUM(quantity*unit_price) AS Toatal_3_product
FROM cleaned_data
GROUP BY product_name
ORDER BY Toatal_3_product DESC;

--9. Product Contribution %
-- This show the revenue contribution by each product in term of precentage.

SELECT 
    product_name,
    SUM(quantity * unit_price) AS product_revenue,
    100.0 * SUM(quantity * unit_price) /
    (SELECT SUM(quantity * unit_price) FROM cleaned_data) AS contribution_percent
FROM cleaned_data
GROUP BY product_name
ORDER BY product_revenue DESC;

--10. Overalll averege rating.
-- This kpi find the average rating by each product category.

SELECT 
    category,
    AVG(customer_rating) AS average_rating
FROM cleaned_data
GROUP BY category;

--11. High Revenue but Low Rating Products.
-- This kpi show that product that genrate high revenu but having a low rating feedback.

SELECT 
    product_name,
    SUM(quantity*unit_price) AS revenue,
    AVG(customer_rating) AS averege_rating
FROM cleaned_data
GROUP BY product_name
HAVING AVG(customer_rating)<3
ORDER BY revenue DESC;

--12. Rating vs reveneu.
-- This kpi show the total_revenue genrated by each customer_rating products;

SELECT 
    customer_rating,
    SUM(quantity * unit_price) AS total_revenue
FROM cleaned_data
GROUP BY customer_rating
ORDER BY customer_rating;

--13. Remarks Distribution1
-- This calculate the total types of remark given to the each product recived by customer.

SELECT 
      product_name,
      remarks,
      COUNT(*) AS total
FROM cleaned_data
GROUP BY product_name,remarks;

--14. Complaint Rate
-- This calculate the pecentage of worst remark.

SELECT 
    100.0 * COUNT(*) / (SELECT COUNT(*) FROM cleaned_data) AS complaint_percentage
FROM cleaned_data
WHERE remarks IN ('damaged', 'late', 'bad');

--15. Remarks vs Average Rating
-- This calculate the average rating to each remark product.
SELECT 
    remarks,
    AVG(customer_rating) AS avg_rating
FROM cleaned_data
GROUP BY remarks
ORDER BY avg_rating DESC;
 
--17. Peak Sales Month
-- Find the month that give the top sales revenue.

SELECT TOP 1
    FORMAT(sale_date, 'yyyy-MM') AS sale_month,
    SUM(quantity*unit_price) AS total_revenue
FROM cleaned_data
GROUP BY FORMAT(sale_date, 'yyyy-MM')
ORDER BY total_revenue DESC;