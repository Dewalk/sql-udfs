SELECT MAX(unitprice)
FROM products;

--------

CREATE OR REPLACE FUNCTION max_price() RETURNS real AS $$
	SELECT MAX(unitprice)
	FROM products;
$$ LANGUAGE SQL;


-------------
SELECT max_price();


-----------------