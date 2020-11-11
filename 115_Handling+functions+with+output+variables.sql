CREATE OR REPLACE FUNCTION sum_n_product (x int, y int, OUT sum int, OUT product int) AS $$
BEGIN
	sum := x + y;
	product := x * y;
	RETURN;
END;
$$ LANGUAGE plpgsql;

SELECT sum_n_product(5, 20);
SELECT (sum_n_product(5, 20)).*;

CREATE OR REPLACE FUNCTION square_n_cube
	(IN x int, OUT square int, OUT cube int) AS $$
BEGIN
	square := x*x;
	cube := x*x*x;
	RETURN;

END;
$$ LANGUAGE plpgsql;

SELECT (square_n_cube(55)).*;
