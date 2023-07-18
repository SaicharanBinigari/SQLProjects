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
