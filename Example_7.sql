----- Return all the info about the newest hire
SELECT *
FROM employees
ORDER BY hiredate DESC; --- Anne Dodsworth
	

----- This function will return the ONE row from the employees table
CREATE OR REPLACE FUNCTION newest_hire() RETURNS employees AS $$
	SELECT *
	FROM employees
	ORDER BY hiredate DESC
	LIMIT 1;
$$ LANGUAGE SQL;

SELECT newest_hire(); ----- Surprise! It is an array

----- can dereference the whole result in this way
SELECT (newest_hire()).*


----- Can also get one column from the result using either method below
SELECT (newest_hire()).lastname;

SELECT lastname(newest_hire());


------

----- Find the product with the highest dollar value of inventory
CREATE OR REPLACE FUNCTION highest_inventory() RETURNS products AS $$

	SELECT * FROM products
	ORDER BY (unitprice*unitsinstock) DESC
	LIMIT 1;

$$ LANGUAGE SQL;

SELECT (highest_inventory()).productname;
SELECT productname(highest_inventory());
