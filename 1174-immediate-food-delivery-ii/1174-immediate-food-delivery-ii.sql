WITH f_order AS(
    SELECT customer_id,
     MIN(order_date) AS f_order_d,
     MIN(customer_pref_delivery_date) AS f_delivery_d
    FROM Delivery
    GROUP BY customer_id
)
SELECT ROUND(AVG(CASE WHEN f_order_d = f_delivery_d THEN 1 ELSE 0 END)*100,2) AS immediate_percentage
FROM f_order