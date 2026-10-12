WITH cte AS (
    SELECT 
        id,
        visit_date,
        people,
        -- Look forward
        LEAD(id, 1) OVER (ORDER BY id) AS next_id1,
        LEAD(id, 2) OVER (ORDER BY id) AS next_id2,
        -- Look backward
        LAG(id, 1) OVER (ORDER BY id) AS prev_id1,
        LAG(id, 2) OVER (ORDER BY id) AS prev_id2
    FROM Stadium
    WHERE people >= 100
)
SELECT id, visit_date, people
FROM cte
WHERE 
    -- Case 1: Current row is the START of a 3+ consecutive sequence
    (next_id1 - id = 1 AND next_id2 - next_id1 = 1) 
    OR 
    -- Case 2: Current row is the MIDDLE of a 3+ consecutive sequence
    (id - prev_id1 = 1 AND next_id1 - id = 1) 
    OR 
    -- Case 3: Current row is the END of a 3+ consecutive sequence
    (id - prev_id1 = 1 AND prev_id1 - prev_id2 = 1)
ORDER BY visit_date ASC;
