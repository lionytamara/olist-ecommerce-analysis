-- Revenue = total harga item (price) dari pesanan berstatus delivered
SELECT
  DATE_TRUNC('month', o.order_purchase_timestamp)::date AS bulan,
  COUNT(DISTINCT o.order_id) AS jumlah_pesanan,
  ROUND(SUM(i.price)::numeric, 2) AS revenue
FROM orders o
JOIN order_items i ON i.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;


SELECT
  COALESCE(t.product_category_name_english, p.product_category_name, 'unknown') AS kategori,
  COUNT(DISTINCT o.order_id) AS jumlah_pesanan,
  ROUND(SUM(i.price)::numeric, 2) AS revenue
FROM order_items i
JOIN orders o ON o.order_id = i.order_id
JOIN products p ON p.product_id = i.product_id
LEFT JOIN product_category_translation t
  ON t.product_category_name = p.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY revenue DESC
LIMIT 10;

WITH bulanan AS (
  SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp)::date AS bulan,
    SUM(i.price) AS revenue
  FROM orders o
  JOIN order_items i ON i.order_id = o.order_id
  WHERE o.order_status = 'delivered'
  GROUP BY 1
)
SELECT
  bulan,
  ROUND(revenue::numeric, 2) AS revenue,
  ROUND(LAG(revenue) OVER (ORDER BY bulan)::numeric, 2) AS revenue_bulan_lalu,
  ROUND((100.0 * (revenue - LAG(revenue) OVER (ORDER BY bulan))
         / NULLIF(LAG(revenue) OVER (ORDER BY bulan), 0))::numeric, 1) AS growth_pct
FROM bulanan
ORDER BY bulan;