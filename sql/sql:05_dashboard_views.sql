CREATE OR REPLACE VIEW vw_customer_orders AS
SELECT
  c.customer_unique_id,
  MIN(c.customer_state) AS customer_state,
  COUNT(DISTINCT o.order_id) AS total_orders,
  CASE WHEN COUNT(DISTINCT o.order_id) > 1 THEN 'Repeat' ELSE 'One-time' END AS customer_type,
  ROUND(SUM(i.price)::numeric, 2) AS total_spent
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items i ON i.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id;

SELECT * FROM vw_orders_fact LIMIT 10;
SELECT * FROM vw_customer_orders LIMIT 10;
