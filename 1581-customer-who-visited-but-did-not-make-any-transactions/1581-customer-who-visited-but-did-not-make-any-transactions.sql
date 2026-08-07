# Write your MySQL query statement below
SELECT v.customer_id,count(v.visit_id) AS "count_no_trans"
FROM Visits v
left JOIN Transactions t
ON v.visit_id = t.visit_id
where t.transaction_id IS NULL
GROUP BY v.customer_id

