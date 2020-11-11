----- This can return MULTIPLE rows. A SET OF rows from the products table

----- Return all orders that were over a threshold of total_sales

CREATE OR REPLACE FUNCTION sold_more_than(total_sales real)
RETURNS SETOF products AS $$
 SELECT * FROM products
 WHERE productid IN (
	 SELECT productid FROM
 	 (SELECT SUM(quantity*unitprice),productid
	 FROM order_details
	 GROUP BY productid
	 HAVING SUM(quantity*unitprice) > total_sales) as qualified_products
 )
$$ LANGUAGE SQL;

SELECT productname, productid, supplierid
FROM sold_more_than(25000);



------


------

SELECT * FROM suppliers
WHERE supplierid IN (
	SELECT supplierid 
	FROM products
	WHERE unitsinstock + unitsonorder < reorderlevel
	);
	  
----- This function returns all supplier info where the total units are below the specified reorder levels in the database

CREATE OR REPLACE FUNCTION suppliers_to_reorder_from()
RETURNS SETOF suppliers AS $$
  SELECT * FROM suppliers
  WHERE supplierid IN (
	 SELECT supplierid FROM products
	  WHERE unitsinstock + unitsonorder < reorderlevel
  )
$$ LANGUAGE SQL;


-----
SELECT * FROM suppliers_to_reorder_from()
