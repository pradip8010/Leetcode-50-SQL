# Write your MySQL query statement below
with daily AS (
    SELECT visited_on, SUM(amount) as amount
    FROM Customer 
    GROUP BY visited_on
),
moving AS(
    SELECT 
          visited_on,
          SUM(amount) OVER(
                ORDER BY visited_on
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,

          AVG(amount) OVER(
                ORDER BY visited_on 
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS average_amount,

          ROW_NUMBER() OVER(
                ORDER BY visited_on ) AS rnk
    FROM daily
)
SELECT 
    visited_on,
    amount, 
    ROUND(average_amount,2) AS average_amount
FROM moving
WHERE rnk >= 7
ORDER BY visited_on