DROP ROUTINE IF EXISTS  max_price();

CREATE FUNCTION max_price() RETURNS real AS $$
BEGIN
	RETURN MAX(unitprice)
	FROM products;
END;
$$ LANGUAGE plpgsql;

SELECT max_price();

DROP ROUTINE IF EXISTS biggest_order;

CREATE FUNCTION biggest_order() RETURNS double precision AS $$
BEGIN
	RETURN MAX(amount)
	FROM
	(SELECT SUM(unitprice*quantity) as amount,orderid
	FROM order_details
	GROUP BY orderid) as totals;
END;
$$ LANGUAGE plpgsql;

SELECT biggest_order();
