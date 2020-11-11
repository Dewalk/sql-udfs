
-- Let's take a look at the customers (there are 91 of them)

SELECT *
FROM customers;

-------

-- Given the customerid, find the largest order for that customer.
DROP FUNCTION customer_largest_order(character);
CREATE OR REPLACE FUNCTION customer_largest_order(cid bpchar) RETURNS double precision AS $$
	SELECT MAX(order_total) FROM
	(SELECT SUM(quantity*unitprice) as order_total,orderid
	FROM orderdetails
	NATURAL JOIN orders
	WHERE customerid = $1   -- NOTE THE SYNTAX. $1 is the first input parameter
	GROUP BY orderid) as order_total;
$$ LANGUAGE SQL;

-----
SELECT customer_largest_order('ANATR');

-----


--- Given a customerid ('ANATR'), find that customer's most ordered product 

SELECT productname
FROM products
WHERE productid IN
	(SELECT productid FROM
	(SELECT SUM(quantity) as total_ordered, productid
	FROM orderdetails
	NATURAL JOIN orders
	WHERE customerid= 'ANATR'
	GROUP BY productid
	ORDER BY total_ordered DESC
	LIMIT 1) as ordered_products);
	

------
CREATE OR REPLACE FUNCTION most_ordered_product(cid bpchar) RETURNS varchar(40) AS $$
	SELECT productname
	FROM products
	WHERE productid IN
	(SELECT productid FROM
	(SELECT SUM(quantity) as total_ordered, productid
	FROM orderdetails
	NATURAL JOIN orders
	WHERE customerid= cid
	GROUP BY productid
	ORDER BY total_ordered DESC
	LIMIT 1) as ordered_products);
$$ LANGUAGE SQL;


-----
SELECT most_ordered_product('ANATR');
