# Write your MySQL query statement below
with cte AS(
    SELECT 
        s.user_id, 
        SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END)AS confirmation_count,
        COUNT(*) AS total_count
    FROM Signups s 
    LEFT JOIN Confirmations c ON s.user_id = c.user_id
    GROUP BY s.user_id
) 
SELECT user_id, ROUND((confirmation_count / total_count),2) AS confirmation_rate
FROM cte