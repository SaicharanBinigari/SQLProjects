USE texture_tales_db;

SELECT * FROM product_details;
SELECT * FROM product_hierarchy;
SELECT * FROM product_prices;
SELECT * FROM sales;

# 1. What was the total quantity sold for all products?

SELECT pd.product_id AS Prodcut_id, pd.product_name AS Product_Name, SUM(s.qty) AS Total_quantity
FROM sales s JOIN product_details pd  ON s.prod_id = pd.product_id
GROUP BY 1,2
ORDER BY 3;

# 2. What is the total generated revenue for all products before discounts?

SELECT pd.product_id AS Prodcut_id, pd.product_name AS Product_Name, SUM(s.qty *s.price) AS total_revenue_before_discounts
FROM Sales s JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY 1,2
ORDER BY 3;

# 3. What was the total discount amount for all products?

SELECT pd.product_id AS Prodcut_id, pd.product_name AS Product_Name, ROUND(SUM(s.qty *s.price*s.discount)/100,2) AS total_discount_amount
FROM Sales s JOIN product_details pd ON s.prod_id = pd.product_id
GROUP BY 1,2
ORDER BY 3;

# 4. What is the total generated revenue for all products after discounts?

SELECT pd.product_id AS Prodcut_id, pd.product_name AS Product_Name, SUM((pd.price * s.qty) - (pd.price * s.qty * s.discount / 100)) AS total_revenue_after_discounts
FROM Sales s
JOIN product_details AS pd ON s.prod_id = pd.product_id
GROUP BY 1,2
ORDER BY 3;

# 5. How many unique transactions were there?

SELECT COUNT(distinct(txn_id)) AS Count_Unique_Transacations
FROM sales;

# 6. What are the average unique products purchased in each transaction?

WITH CTE AS (SELECT COUNT(distinct(prod_id)) AS Unique_Products, txn_id
 FROM sales GROUP BY txn_id)
 SELECT ROUND(AVG(Unique_Products),1) FROM CTE;

#7. What is the average discount value per transaction?

WITH CTE AS (SELECT SUM(qty*price*discount)/100 AS Discount_Value, txn_id
 FROM sales GROUP BY txn_id)
 SELECT ROUND(AVG(Discount_Value),1) AS Avg_Discount_Value  FROM CTE;
 
 #8. What is the average revenue for member transactions and non-member transactions?

SELECT member, ROUND(AVG(Revenue),1) AS average_revenue
FROM (
    SELECT txn_id, member, SUM(qty * price) AS Revenue
    FROM sales
    GROUP BY txn_id, member
) AS subquery
GROUP BY  member;

# Using CTE
 WITH CTE AS (
   SELECT txn_id, member, SUM(qty*price) AS Revenue FROM sales
   GROUP BY 1,2
 )
SELECT member, ROUND(AVG(Revenue),1) AS Avg_Revenue FROM CTE
GROUP BY member;

#9. What are the top 3 products by total revenue before discount?

SELECT pd.product_id AS Product_id, pd.product_name AS Product_name, SUM(s.qty*s.price) AS Total_Revenue
FROM sales s
JOIN
product_details pd
ON s.prod_id = pd.product_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 3;

#10. What are the total quantity, revenue and discount for each segment?

SELECT  pd.segment_name AS Segment_name, SUM(s.qty) AS Total_Quantity, SUM(s.qty*s.price) AS Revenue,  ROUND(SUM(s.qty*s.price*s.discount)/100, 2) AS Discount
FROM sales s
JOIN
product_details pd
ON s.prod_id = pd.product_id
GROUP BY 1

#11. What is the top selling product for each segment?

WITH segment_sales AS (
    SELECT pd.segment_name AS Segment_Name, pd.product_name AS Product_Name, SUM(s.qty) AS Total_quantity,
        ROW_NUMBER() OVER (PARTITION BY pd.segment_name ORDER BY SUM(s.qty) DESC) AS rn
    FROM sales s
    JOIN product_details pd  ON s.prod_id = pd.product_id
    GROUP BY 1,2
)
SELECT Segment_Name, Product_Name, Total_quantity
FROM segment_sales
WHERE rn = 1;

#12. What are the total quantity, revenue and discount for each category?

SELECT  pd.category_name AS Category_Name, SUM(s.qty) AS Total_Quantity, SUM(s.qty*s.price) AS Revenue,  ROUND(SUM(s.qty*s.price*s.discount)/100, 2) AS Discount
FROM sales s
JOIN
product_details pd
ON s.prod_id = pd.product_id
GROUP BY 1

#13. What is the top selling product for each category?

WITH category_sales AS (
    SELECT pd.category_name AS Category_Name, pd.product_name AS Product_Name, SUM(s.qty) AS Total_quantity,
        ROW_NUMBER() OVER (PARTITION BY pd.category_name ORDER BY SUM(s.qty) DESC) AS rn
    FROM sales s
    JOIN product_details pd  ON s.prod_id = pd.product_id
    GROUP BY 1,2
)
SELECT Category_Name, Product_Name, Total_quantity
FROM category_sales
WHERE rn = 1;
    








