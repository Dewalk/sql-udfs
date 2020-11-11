--- Find biggest_order. 
--- Need to use the order_details table, so let's see what's in there.

SELECT * 
FROM orderdetails
LIMIT 3;

--- so, let's multiple the unitprice * quantity


--------
CREATE OR REPLACE FUNCTION biggest_order() RETURNS double precision AS $$

	SELECT MAX(amount)
	FROM
	(SELECT SUM(unitprice*quantity) as amount, orderid
	FROM orderdetails
	GROUP BY orderid) AS totals;

$$ LANGUAGE SQL;

---------------------

SELECT biggest_order();

------ this only returns one item, the amount of the biggest order
------ IRL, you'd obviously want to know what was ordered, who was the customer, etc.

