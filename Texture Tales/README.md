The provided is the Texture Tales Database and it consists of following Tables:

Table: Product Details

Columns:

product_id (varchar)
price (int)
product_name (varchar)
category_id (int)
segment_id (int)
style_id (int)
category_name (varchar)
segment_name (varchar)
style_name (varchar)
Table: Sales

Columns:

prod_id (varchar)
qty (int)
price (int)
discount (int)
member (varchar)
txn_id (varchar)
start_txn_time (varchar)
Table: product_prices

Columns:

id (int)
product_id (varchar)
price (int)
Table: product_hierarchy

Columns:

id (int)
product_id (int)
price (int)
start_date (date)
end_date (date)

By leveraging the data from these tables, I performed comprehensive analyses and generated insights for below questions.

1. What was the total quantity sold for all products? 
2. What is the total generated revenue for all products before 
discounts?
3. What was the total discount amount for all products?
4. What is the total generated revenue for all products after 
discounts?
5. How many unique transactions were there?
6. What are the average unique products purchased in each 
transaction?
7. What is the average discount value per transaction?
8. What is the average revenue for member transactions and nonmember transactions?
9. What are the top 3 products by total revenue before discount?
10. What are the total quantity, revenue and discount for each 
segment?
11. What is the top selling product for each segment?
12. What are the total quantity, revenue and discount for each 
category?
13. What is the top selling product for each category?

