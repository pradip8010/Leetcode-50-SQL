# Write your MySQL query statement below
with cte AS (
    SELECT
          e.id,
          e.name AS Employee,
          d.name AS Department,
          e.salary AS Salary,
          DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT  Department,Employee,Salary
FROM cte
WHERE rnk <= 3;