--- EXAMPLE #1

SELECT COUNT(*)
FROM suppliers
WHERE homepage IS NULL;

----

CREATE  OR REPLACE FUNCTION fix_homepage() RETURNS void AS $$
	UPDATE suppliers
	SET homepage='N/A'
	WHERE homepage IS NULL;
$$ LANGUAGE SQL;

----------
SELECT fix_homepage();

-------------
SELECT COUNT(*)
FROM suppliers
WHERE homepage IS NULL;

