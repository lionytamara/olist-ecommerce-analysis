-- tingkat keterlambatan
-- Terlambat = tiba di pelanggan setelah tanggal estimasi
SELECT
  COUNT(*) AS total_delivered,
  COUNT(*) FILTER (WHERE order_delivered_customer_date > order_estimated_delivery_date) AS terlambat,
  ROUND(100.0 * COUNT(*) FILTER (WHERE order_delivered_customer_date > order_estimated_delivery_date)
        / COUNT(*), 2) AS terlambat_pct
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;

-- rating tepat waktu vs terlambat
WITH pengiriman AS (
  SELECT
    order_id,
    CASE WHEN order_delivered_customer_date > order_estimated_delivery_date
         THEN 'terlambat' ELSE 'tepat waktu' END AS status_pengiriman
  FROM orders
  WHERE order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
),
rating_per_pesanan AS (
  -- Sebagian pesanan punya lebih dari satu review, jadi dirata-rata per pesanan
  SELECT order_id, AVG(review_score) AS rating
  FROM order_reviews
  GROUP BY order_id
)
SELECT
  p.status_pengiriman,
  COUNT(*) AS jumlah_pesanan,
  ROUND(AVG(r.rating)::numeric, 2) AS rata_rata_rating
FROM pengiriman p
JOIN rating_per_pesanan r ON r.order_id = p.order_id
GROUP BY p.status_pengiriman;


-- seberapa parah keterlambatan memengaruhi rating
WITH pengiriman AS (
  SELECT
    order_id,
    order_delivered_customer_date::date - order_estimated_delivery_date::date AS selisih_hari
  FROM orders
  WHERE order_status = 'delivered'
    AND order_delivered_customer_date IS NOT NULL
),
rating_per_pesanan AS (
  SELECT order_id, AVG(review_score) AS rating
  FROM order_reviews
  GROUP BY order_id
)
SELECT
  CASE
    WHEN selisih_hari <= 0 THEN '1. Tepat waktu / lebih cepat'
    WHEN selisih_hari <= 3 THEN '2. Telat 1-3 hari'
    WHEN selisih_hari <= 7 THEN '3. Telat 4-7 hari'
    ELSE '4. Telat > 7 hari'
  END AS kelompok,
  COUNT(*) AS jumlah_pesanan,
  ROUND(AVG(r.rating)::numeric, 2) AS rata_rata_rating
FROM pengiriman p
JOIN rating_per_pesanan r ON r.order_id = p.order_id
GROUP BY 1
ORDER BY 1;

-- state dengan keterlambatan tertinggi
SELECT
  c.customer_state,
  COUNT(*) AS jumlah_pesanan,
  ROUND(100.0 * COUNT(*) FILTER (WHERE o.order_delivered_customer_date > o.order_estimated_delivery_date)
        / COUNT(*), 2) AS terlambat_pct
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
HAVING COUNT(*) >= 100
ORDER BY terlambat_pct DESC
LIMIT 10;