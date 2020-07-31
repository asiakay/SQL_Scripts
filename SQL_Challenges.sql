-- todo
-- Complete the challenges in MySQL Workbench
-- Save the script in a folder called SQL scripts
-- Push to GitHub

-- 1. find all products--
SELECT * FROM products;
-- 2. find all products that cost $1400
SELECT * FROM PRODUCTS WHERE PRICE = 1400;
-- 3. find all products that cost 11.99 or 13.99
SELECT * FROM PRODUCTS WHERE PRICE = 11.99 OR PRICE =13.99;
-- 4. find all products that do NOT cost 11.99 - using NOT
SELECT * FROM PRODUCTS WHERE NOT PRICE = 11.99;
-- 5. find  all products and sort them by price from greatest to least
SELECT * FROM PRODUCTS ORDER BY PRICE;
-- 6. find all employees who don't have a middle initial
SELECT * from employees
Where middleinitial is null;
-- 7. find distinct product prices
SELECT DISTINCT PRICE FROM PRODUCTS;
-- 8. find all employees whose first name starts with the letter ‘j’
SELECT * FROM employees WHERE FIRSTNAME LIKE 'J%';
-- 9. find all Macbooks --
SELECT * FROM PRODUCTS WHERE NAME = 'MACBOOK';
-- 10. find all products that are on sale
 SELECT * FROM PRODUCTS WHERE ONSALE  = '1'; 
-- 11. find the average price of all products --
 SELECT AVG(PRICE) FROM PRODUCTS;
-- 12. SELECT AVG(PRICE) AS 'AVERAGE PRICE' FROM PRODUCTS;
-- find all Geek Squad employees who don't have a middle initial --
SELECT * FROM employees WHERE title.MiddleInitial IS null AND Title = 'GEEK SQUAD';
-- 13. Find all products from the products table whose stock level 
-- is in the range of 500 to 1200. 
-- Order by Price from least to greatest. **Try this with the between keyword** 
 SELECT * FROM PRODUCTS 
 WHERE StockLevel
 BETWEEN 500 AND 1200
 ORDER BY PRICE ASC, STOCKLEVEL DESC;

-- JOINS SECTION:
-- 14. joins: select all the computers from the products table:
--  using the products table and the categories table, 
--  return the product name and the category name,

 SELECT p.Name, c.Name
 FROM bestbuy.products AS p
 LEFT JOIN bestbuy.categories AS c
 ON p.CategoryID = c.CategoryID
 WHERE c.CategoryID = 1;
 
-- 15. joins: find all product names, product prices, 
-- and products ratings that have a rating of 5

SELECT p.Name, p.Price, r.Rating 
 FROM bestbuy.reviews AS r
 LEFT JOIN bestbuy.products AS p
 ON r.ProductID = p.ProductID
 WHERE r.Rating = 5;

-- 16. Right Join the employee with the most total quantity sold.  
-- use the sum() function and group by
-- joins: find the employee with the most total quantity sold.  
-- use the sum() function and group bySELECT 
-- 

Select e.FirstName, e.LastName, SUM(s.Quantity) AS Total
FROM bestbuy.sales AS s
INNER JOIN bestbuy.employees AS e 
ON e.EmployeeID = s.EmployeeID
GROUP BY e.FirstName, e.LastName
ORDER BY Total DESC
LIMIT 1;

-- 17. joins: select all the computers from the products table:
-- using the products table and the categories table, join together 
-- return the product name and the category name

SELECT departments.name, categories.name FROM departments
inner join categories ON categories.DepartmentID = departments.DepartmentID
WHERE categories.name = 'Appliances' or categories.name = 'Games';

-- 18. joins: find the product name, total # sold, and total price sold, 
-- for Eagles: Hotel California --You may need to use SUM()

SELECT p.Name, SUM(s.Quantity) AS TotalSold, SUM(s.Quantity * s.PricePerUnit) AS Total
FROM products AS p
INNER JOIN sales AS s 
ON s.ProductID = p.ProductID
WHERE p.ProductID = 97;

-- 19. joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)
 
SELECT p.Name AS 'Product Name', r.Reviewer, r.Rating, r.Comment
FROM Reviews AS r
INNER JOIN products AS p 
ON p.ProductID = r.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;
/*  20. Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, 
the name of each product, how many of that product they sold */

