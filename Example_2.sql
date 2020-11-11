SELECT photopath
FROM employees;

-----
UPDATE employees
SET photopath = NULL
WHERE photopath IS NOT NULL;

----

SELECT photopath
FROM employees;

--------
CREATE OR REPLACE FUNCTION set_employee_default_photo() RETURNS void AS $$
	UPDATE employees
	SET photopath='http:///default_photo.bmp'
	WHERE photopath IS NULL;
$$ LANGUAGE SQL;

-----

SELECT set_employee_default_photo();

-----

SELECT photopath
FROM employees;