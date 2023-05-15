/*

Sales Insights Project - Jeremiah Sanville

*/

-- See all types of currencies used
SELECT DISTINCT transactions.currency FROM transactions;

-- Check two currencies entered twice "INR" and "INR\r"
SELECT count(*) FROM transactions WHERE transactions.currency="INR\r";

-- Check two currencies entered twice "INR" and "INR\r" -> Found that "INR\r" has significantly more records than "INR"
SELECT count(*) FROM transactions WHERE transactions.currency="INR";

-- Check two currencies entered twice: "INR\r" and "INR" -> Found "INR" are duplicate data points of "INR\r"
SELECT * FROM transactions WHERE order_date="2017-10-10" AND sales_amount="41241";
SELECT * FROM transactions WHERE order_date="2018-04-06" AND sales_amount="875";
SELECT * FROM transactions WHERE order_date="2017-04-11" AND sales_amount="583";

-- Check two currencies entered twice: "USD\r" and "USD" -> Found "USD" are duplicate data points of "USD\r"
SELECT * FROM transactions WHERE transactions.currency="USD\r" OR transactions.currency="USD";

-- Delete duplicate data
DELETE FROM transactions WHERE transactions.currency="INR" OR transactions.currency="USD";

-- Confirm duplicate data was deleted correctly
SELECT DISTINCT transactions.currency FROM transactions;

-- See all transactions
SELECT * FROM transactions;

-- Count number of transactions
SELECT count(*) FROM transactions;

-- Count number of customers
SELECT count(*) FROM customers;

-- See all transactions in Chennai
SELECT * FROM transactions WHERE market_code="Mark001";

-- See all transactionsdone with USD
SELECT * FROM transactions WHERE currency="USD";

-- Inner join transactions table and date table
SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date;

-- Show all transactions from 2020
SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020;

-- Sum of sales done in 2020
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020;

-- Sum of sales done in 2020 in Chennai
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date WHERE date.year=2020 AND transactions.market_code="Mark001";

-- Unique products sold in Chennai
SELECT DISTINCT product_code FROM transactions WHERE market_code="Mark001";



