CREATE OR REPLACE VIEW vw_category_sales AS
SELECT
  DATE_TRUNC('month', o.order_purchase_timestamp)::date AS order_month,
  COALESCE(t.product_category_name_english, p.product_category_name, 'unknown') AS category,
  COUNT(DISTINCT o.order_id) AS orders,
  SUM(i.price) AS revenue
FROM order_items i
JOIN orders o ON o.order_id = i.order_id
JOIN products p ON p.product_id = i.product_id
LEFT JOIN product_category_translation t ON t.product_category_name = p.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY 1, 2;