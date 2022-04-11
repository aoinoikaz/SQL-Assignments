/* Devon Tomlin - 7321599 
SQL - Assignment 1
Friday February 11, 2022 */

/* Q1 3-06 */
SELECT vendor_name as vendorName, vendor_contact_last_name as vendorContactLastName,  vendor_contact_first_name as vendorContactFirstName FROM vendors
ORDER BY 
vendorContactLastName ASC,
vendorContactFirstName ASC;

/* Q2 3-07 */  
SELECT CONCAT(vendor_contact_last_name, ", ", vendor_contact_first_name) AS full_name 
FROM vendors WHERE left(vendor_contact_last_name, 1) = 'A' 
OR left(vendor_contact_last_name, 1) = 'B' 
OR left(vendor_contact_last_name, 1) = 'C'
OR left(vendor_contact_last_name, 1) = 'E';

/* Q3 3-08 */
SELECT invoice_due_date as "Due Date", invoice_total as "Invoice Total", invoice_total / 0.1 as "10%", invoice_total * 0.1 as "Plus 10%" 
FROM invoices WHERE invoice_total >= 500 AND invoice_total <= 1000
ORDER BY invoice_due_date ASC;

/* Q4 3-09 - Didn't figure this out in time */
SELECT invoice_number, invoice_total, (payment_total + credit_total) AS payment_credit_total, balance_due = (
SELECT invoice_total - (payment_total + credit_total) as balance_due WHERE balance_due > 50 )
FROM invoices
ORDER BY balance_due DESC
LIMIT 5;

/* Q5 3-10*/
SELECT invoice_number, invoice_date, invoice_total - (payment_total + credit_total) as balance_due, payment_date FROM invoices
WHERE isnull(payment_date);

/* Q6 3-11 */
SELECT DATE_FORMAT(CURRENT_DATE, "%d/%m/%y") as "current_date";

/* Q7 3-12 */
SELECT 50000 as starting_principle, 50000 / 0.065 as interest
UNION ALL
SELECT starting_principal + interest as principal_plus_interest;

/* MGS Exercies */

/* Q1 3-1*/
SELECT product_code, product_name, list_price, discount_percent FROM products
ORDER BY list_price DESC;

/* Q2 3-3*/
SELECT product_name, list_price, date_added FROM products
WHERE list_price > 500 AND list_price < 2000
ORDER BY date_added DESC; 

/* Q3 3-5 */
SELECT item_id, item_price, discount_amount, quantity FROM order_items, price_total = item_price * quantity,
discount_total = discount_amount * quantity, item_total = (item_price - discount_amount) * quantity)
WHERE item_total > 500
ORDER BY item_total DESC;

/* Q3 3-6 */
SELECT order_id, order_date, ship_date FROM orders where isnull(ship_date);

/* Q3 3-8 */
SELECT 100 AS price, 0.07 AS tax_rate, 100*0.07 as tax_amount, 100 + (0.07*100) AS total;