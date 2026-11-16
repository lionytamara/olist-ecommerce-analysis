CREATE OR REPLACE VIEW vw_orders_fact AS
WITH items AS (
  SELECT order_id, SUM(price) AS revenue, SUM(freight_value) AS freight
  FROM order_items
  GROUP BY order_id
),
rev AS (
  SELECT order_id, AVG(review_score) AS review_score
  FROM order_reviews
  GROUP BY order_id
)
SELECT
  o.order_id,
  c.customer_unique_id,
  c.customer_state,
  o.order_purchase_timestamp::date AS order_date,
  DATE_TRUNC('month', o.order_purchase_timestamp)::date AS order_month,
  i.revenue,
  i.freight,
  o.order_delivered_customer_date::date AS delivered_date,
  o.order_estimated_delivery_date::date AS estimated_date,
  (o.order_delivered_customer_date::date - o.order_estimated_delivery_date::date) AS delay_days,
  CASE WHEN o.order_delivered_customer_date IS NULL THEN NULL
       WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date THEN 1
       ELSE 0 END AS is_late,
  r.review_score
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
LEFT JOIN items i ON i.order_id = o.order_id
LEFT JOIN rev r ON r.order_id = o.order_id
WHERE o.order_status = 'delivered';