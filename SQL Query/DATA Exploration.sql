-- 4.1 Write query to retrieve all customer information
SELECT * FROM customers

-- 4.2 Query accounts for a specific customer
SELECT * FROM accounts WHERE customer_id = (SELECT customer_id FROM customers WHERE first_name = 'John' and last_name = 'Rogers');

-- 4.3 Find the customer name and account balance for each account
SELECT customer.first_name,customer.last_name, account.balance FROM accounts account JOIN customers customer ON account.customer_id = customer.customer_id;

-- 4.4 Analyze customer loan balances:
SELECT 
    COUNT(DISTINCT c.customer_id) AS total_customers_with_loans,
    SUM(l.loan_amount) AS total_loans,
    AVG(l.loan_amount) AS average_loan_amount
FROM 
    customers AS c
JOIN 
    loans AS l ON l.customer_id = c.customer_id;

-- 4.5 List all customers who have made a transaction in the 2024-03
SELECT 
	customer.customer_id,first_name,customer.last_name,dtransaction.transaction_amount 
FROM 
	customers customer Join transactions dtransaction ON dtransaction.account_id =  customer.customer_id
WHERE 
	transaction_date between '2024-03-01' AND '2024-03-21'
