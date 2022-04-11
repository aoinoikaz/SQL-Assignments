/* Devon Tomlin - 7321599 
SQL - Assignment 2
Friday February 25, 2022 */

/* ---------- Task 1 ---------- */
/* Q1. MGS Exercise 4-1 */
USE my_guitar_shop;
SELECT category_name, product_name, list_price 
FROM categories
INNER JOIN products
ON categories.category_id = products.category_id
ORDER BY categories.category_name, products.product_name ASC;

/* Q2. MGS Exercise 4-2 */
USE my_guitar_shop;
SELECT first_name, last_name, line1, city, state, zip_code
FROM customers
INNER JOIN addresses
ON customers.customer_id = addresses.customer_id
WHERE email_address = 'allan.sherwood@yahoo.com';

/* Q3. MGS Exercise 4-4 */
USE my_guitar_shop;
SELECT last_name, first_name, order_date, product_name, item_price, discount_amount, quantity 
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
ORDER BY last_name, order_date, product_name;

/* Q4. MGS Exercise 4-5 */
USE my_guitar_shop;
SELECT p.product_id, p.product_name, p.list_price
FROM products p JOIN products sj
ON p.product_id <> sj.product_id AND p.list_price = sj.list_price;

/* Q5. MGS Exercise 4-7  */
USE my_guitar_shop;
SELECT order_id, order_date, 'SHIPPED' as ship_status
FROM orders where ship_date IS NOT NULL
UNION
SELECT order_id, order_date, 'NONSHIPPED' as ship_status 
FROM orders WHERE ship_date is null;

/* ---------- Task 2 ---------- */

/* Q1. SWE Exercise 1 */
USE swexpert;
SELECT DISTINCT c_city as City FROM consultant ORDER BY c_city ASC;

/* Q2. SWE Exercise 2 */
USE swexpert;
SELECT p_id, project_name FROM project WHERE parent_p_id is not null;

/* Q3. SWE Exercise 3*/
/* Using table aliases, then a 'computed column' for the parent project name */
USE swexpert;
SELECT p.p_id, p.project_name, p.parent_p_id, sj.project_name as 'parent project_name'
/* The above statement uses the alias p, which causes this line to be called first */
FROM project p
LEFT JOIN project sj
ON p.parent_p_id = sj.p_id;

/* Q4. SWE Exercise 4 */
USE swexpert;
SELECT c_id, skill_id, certification 
FROM consultant_skill WHERE certification = 'Y' ORDER BY skill_id, c_id;

/* Q5. SWE Exercise 5 */
USE swexpert;
SELECT c.c_id, c.c_first, c.c_last, s.skill_id, s.skill_description
FROM consultant c
JOIN consultant_skill cs ON cs.c_id = c.c_id
JOIN skill as s ON s.skill_id = cs.skill_id
WHERE certification = 'Y' ORDER BY s.skill_id, c.c_id;


