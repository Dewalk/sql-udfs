SELECT firstname,lastname,hiredate
FROM newest_hire();

SELECT productname,companyname
FROM highest_inventory() AS hi
JOIN suppliers ON hi.supplierid=suppliers.supplierid;
