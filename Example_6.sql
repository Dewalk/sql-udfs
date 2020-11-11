----- we are now passing the entire products table as a parameter
----- we are also passing the increase_percent

----- notice that we are still returning a single number from this function 
CREATE OR REPLACE FUNCTION new_price(products, increase_percent numeric)
RETURNS double precision AS $$ SELECT $1.unitprice * increase_percent/100
$$ LANGUAGE SQL

----- Notice how we pass the products table to the function! 
SELECT productname, unitprice, new_price(products.*,110)
FROM products;

-----

----- make a full name function that combines the title, first name, and last name 
CREATE OR REPLACE FUNCTION full_name(employees) RETURNS varchar(62) AS $$
	SELECT CONCAT($1.title, ' ', $1.firstname, ' ', $1.lastname)
$$ LANGUAGE SQL;

-----

SELECT full_name(employees.*),city,country
FROM employees;
