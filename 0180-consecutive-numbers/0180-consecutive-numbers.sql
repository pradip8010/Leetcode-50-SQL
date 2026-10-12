# Write your MySQL query statement below
# using lag

with cte as (
    SELECT
        id,
        num,
        LAG(num, 1) OVER(ORDER BY id) AS prev_num,
        LAG(num, 2) OVER(ORDER BY id) AS prev_prev_num
    FROM Logs
)
SELECT DISTINCT
    num AS ConsecutiveNums
FROM cte
WHERE num = prev_num and num = prev_prev_num