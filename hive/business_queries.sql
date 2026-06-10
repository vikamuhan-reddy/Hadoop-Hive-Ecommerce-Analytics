SELECT
c.customer_state,
COUNT(*) AS total_orders
FROM orders_raw o
JOIN customers_raw c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;
