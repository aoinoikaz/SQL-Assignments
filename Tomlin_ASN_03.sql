/* Devon Tomlin - 7321599 
SQL - Assignment 3
Friday March 11, 2022 */

/* ---------- Task 1 ---------- */
/* Q1. Textbook Exercise 5-04  */

use ap;
INSERT INTO invoices VALUES (115,
32, 'AX-014-027', '2014/1/08', '434.58', '0.00', '0.00', 2, '2014/8/31', null);

/* Q2. Textbook Exercise 5-05 */
use ap;
INSERT INTO invoice_line_items (invoice_id, invoice_sequence, account_number, line_item_amount, line_item_description) 
VALUES 
(last_insert_id(), 1, 160, '180.23', 'Hard drive'),
(last_insert_id(), 2, 527, '254.35', 'Exchange Server update');

/* Q3. Textbook Exercise 5-06 */
use ap;
UPDATE invoices
SET credit_total = invoice_total * 0.1, payment_total = (payment_total + credit_total)
where payment_total = invoice_total;

/* Q4. Textbook Exercise 5-09 */
use ap;
DELETE FROM invoice_line_items where invoice_id = 115;
DELETE FROM invoices WHERE invoice_id = 115;

/* ---------- Task 2 ---------- */
/* Q1. MGS Exercise 5-1   */

use my_guitar_shop;
INSERT INTO categories VALUES (last_insert_id(), 'Wind');

use my_guitar_shop;
UPDATE categories
SET category_name = 'String'
WHERE category_id = last_insert_id();

use my_guitar_shop;
DELETE FROM categories where category_id = last_insert_id();

/* Q2. MGS Exercise 5-4   */
INSERT INTO products (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES (last_insert_id(), 4, 'dgx_640', 'Yamaha DGX 640 Digital Piano', 
'This is the Yamaha DGX 640 Digital Piano with 88 keys.', '845.95', 10, now());

use my_guitar_shop;
UPDATE products
SET discount_percent = 30
WHERE product_id = last_insert_id();

/* Q3. MGS Exercise 5-7   */
use my_guitar_shop;
INSERT INTO customers (email_address, password, first_name, last_name) 
VALUES ('dtomlin1599@conestogac.on.ca', ' ', 'Devon', 'Tomlin');

use my_guitar_shop;
UPDATE customers
SET password = 's3cr3t'
WHERE email_address = 'dtomlin1599@conestogac.on.ca';

/* ---------- Task 3 ---------- */

/* Q1. SWE Exercise 1 */
use swexpert;
INSERT INTO consultant VALUES (106, 'Tomlin', 'Devon', 'A', '723 Bingo Drive', 
'Whoville', 'BC', 'N7K8V9', '5191234567', 'johndoe@gmail.com');

/* Q2. SWE Exercise 2 */
use swexpert;
INSERT INTO client VALUES (17, 'City of Waterloo', 'Jaworsky', 'Dave', '5198861550');

/* Q3. SWE Exercise 3 */
use swexpert;
INSERT into project (p_id, project_name, client_id) VALUES (98, 'ION Rapid Transit', 17);

/* Q4. SWE Exercise 4 */
use swexpert;
UPDATE project
SET parent_p_id = 98
WHERE p_id <> 98;
