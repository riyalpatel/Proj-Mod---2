-- 5.1 Calculate the total balance across all accounts for each customer:
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(a.balance) AS total_balance
FROM 
    customers AS c
JOIN 
    accounts AS a ON a.customer_id = c.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name;

-- 5.2 Calculate the average loan amount for each loan term
SELECT 
    loan_term, 
    AVG(loan_amount) AS average_loan_amount
FROM 
    loans
GROUP BY 
    loan_term

-- 5.3 Find the total loan amount and interest across all loans

SELECT 
    SUM(loan_amount) AS total_loan_amount,
    SUM(loan_amount * (interest_rate / 100)) AS total_interest
FROM 
    loans;

-- 5.4 Find the most frequent transaction type
Select 
	transaction_type,count(transaction_type) AS Frequent_transaction 
from 
	transactions 
group by 
	transaction_type;

-- 5.5 Analyze transactions by account and transaction type
SELECT 
    a.account_id,
    a.account_type,
    t.transaction_type,
    COUNT(t.transaction_id) AS transaction_count,
    SUM(t.transaction_amount) AS total_transaction_amount
FROM 
    accounts a
JOIN 
    transactions t ON a.account_id = t.account_id
GROUP BY 
    a.account_id, 
    a.account_type, 
    t.transaction_type
