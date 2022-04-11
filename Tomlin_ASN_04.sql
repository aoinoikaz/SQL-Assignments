/* Devon Tomlin - 7321599 
SQL - Assignment 4
Friday April 8, 2022 */

/* ========== Task 1 ========== */
/* Q1. MGS Exercise 6-1 */
use my_guitar_shop;
SELECT COUNT(order_id), SUM(tax_amount) FROM orders;

/* Q2. MGS Exercise 6-2 */
use my_guitar_shop;
SELECT category_name, COUNT(product_id) , max(list_price)
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_id;

/* Q3. MGS Exercise 6-6 */
use my_guitar_shop;
SELECT product_name, (item_price - discount_amount * quantity) as total_amount 
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY total_amount WITH ROLLUP;

/* Q4. MGS Exercise 7-3 */
use my_guitar_shop;
SELECT category_name FROM categories as c
WHERE NOT EXISTS 
(
	SELECT * FROM products p 
    WHERE c.category_id = p.category_id
);

/* ========== Task 2 ========== */
/* Q1. SWE Exercise 1 */
use swexpert;
SELECT ROUND(AVG(score), 1) as Average_Score FROM evaluation WHERE evaluatee_id = '105';

/* Q2. SWE Exercise 2 */
use swexpert;
SELECT COUNT(c_id) as Skilled_Consultants FROM consultant_skill WHERE skill_id = '1';

/* Q3. SWE Exercise 3*/
/* I am struggling to wrap my head around sub queries. Really had no idea - same with Q4. Was completely lost. */
use swexpert;
SELECT c_first, c_last FROM consultant c 
JOIN project_consultant pc ON pc.c_id = c.c_id
WHERE
(
	SELECT p_id FROM pc WHERE c.c_first = 'Mark' AND c.c_last = 'Myers'
);

/* Q4. SWE Exercise 4 */
/* Refer to Q3 notes. */
use swexpert;
SELECT project.p_id, project.project_name FROM project p
JOIN evaluation e ON e.p_id = p.p_id
JOIN consultant c ON c.p_id = p.p_id
WHERE e.e_id <> NULL AND c.c_last RLIKE '^[z]';

/* ========== Task 3 ========== */
/* Q1. SWE Exercise 1 */

/* a. */
use swexpert;
ALTER TABLE project_consultant ADD total_days INTEGER DEFAULT 0;

/* b. */
use swexpert;
UPDATE project_consultant
SET total_days = (roll_off_date - roll_on_date)
WHERE p_id <> '0';

/* c. */
use swexpert;
SELECT * FROM project_consultant;

/* d. */
use swexpert;
ALTER TABLE project_consultant
DROP COLUMN total_days;

/* Q2. SWE Exercise 2*/

/* a. */
use swexpert;
DROP TABLE IF EXISTS evaluation_audit;

/* b. */
use swexpert;
CREATE TABLE evaluation_audit (
audit_id INTEGER auto_increment PRIMARY KEY,
audit_e_id INTEGER NOT NULL,
audit_score INTEGER,
audit_user VARCHAR(20)
);

/* c. */
use swexpert;
INSERT INTO evaluation_audit (audit_e_id, audit_score) VALUES ('100', '90');

/* d. */
use swexpert;
SELECT * FROM evaluation_audit;

/* Q3. SWE Exercise 3 */

/* a. */
UPDATE evaluation_audit
SET audit_user = ''
WHERE audit_id = 1;

use swexpert;
ALTER TABLE evaluation_audit MODIFY COLUMN audit_user VARCHAR(20) NOT NULL;

/* b. */
use swexpert;
ALTER TABLE evaluation_audit ADD audit_date date;

/* c. */
use swexpert;
INSERT INTO evaluation_audit (audit_e_id, audit_score, audit_user, audit_date) VALUES ('100', '95', USER(), SYSDATE());

/* d. */
use swexpert;
SELECT * FROM evaluation_audit;

/* e. */
use swexpert;
INSERT INTO evaluation_audit (audit_e_id, audit_score, audit_user, audit_date) VALUES ('100', '99', 'sdfadsasd', 'asdasdasd');

/* Q4. SWE Exercise 4 */
use swexpert;
INSERT INTO project_skill (p_id, skill_id) VALUES (4, NULL);

/* Q5. SWE Exercise 5 */
use swexpert;
DELETE FROM consultant WHERE c_id = '100';