-- Berapa pelanggan yang memesan 1x, 2x, 3x, dst
WITH pesanan_per_pelanggan AS (
  SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS jumlah_pesanan
  FROM orders o
  JOIN customers c ON c.customer_id = o.customer_id
  WHERE o.order_status = 'delivered'
  GROUP BY c.customer_unique_id
)
SELECT
  jumlah_pesanan,
  COUNT(*) AS jumlah_pelanggan
FROM pesanan_per_pelanggan
GROUP BY jumlah_pesanan
ORDER BY jumlah_pesanan;


-- persentase repeat purchase 
WITH pesanan_per_pelanggan AS (
  SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS jumlah_pesanan
  FROM orders o
  JOIN customers c ON c.customer_id = o.customer_id
  WHERE o.order_status = 'delivered'
  GROUP BY c.customer_unique_id
)
SELECT
  COUNT(*) AS total_pelanggan,
  COUNT(*) FILTER (WHERE jumlah_pesanan > 1) AS pelanggan_repeat,
  ROUND(100.0 * COUNT(*) FILTER (WHERE jumlah_pesanan > 1) / COUNT(*), 2) AS repeat_rate_pct
FROM pesanan_per_pelanggan;

-- cohort retention sederhana
WITH pembelian AS (
  SELECT
    c.customer_unique_id,
    DATE_TRUNC('month', o.order_purchase_timestamp)::date AS bulan_beli
  FROM orders o
  JOIN customers c ON c.customer_id = o.customer_id
  WHERE o.order_status = 'delivered'
),
cohort AS (
  SELECT customer_unique_id, MIN(bulan_beli) AS bulan_cohort
  FROM pembelian
  GROUP BY customer_unique_id
),
aktivitas AS (
  SELECT DISTINCT
    p.customer_unique_id,
    ch.bulan_cohort,
    (EXTRACT(YEAR FROM AGE(p.bulan_beli, ch.bulan_cohort)) * 12
     + EXTRACT(MONTH FROM AGE(p.bulan_beli, ch.bulan_cohort)))::int AS bulan_ke
  FROM pembelian p
  JOIN cohort ch ON ch.customer_unique_id = p.customer_unique_id
)
SELECT
  bulan_cohort,
  COUNT(DISTINCT customer_unique_id) FILTER (WHERE bulan_ke = 0) AS ukuran_cohort,
  COUNT(DISTINCT customer_unique_id) FILTER (WHERE bulan_ke = 1) AS kembali_bulan_1,
  COUNT(DISTINCT customer_unique_id) FILTER (WHERE bulan_ke = 2) AS kembali_bulan_2,
  COUNT(DISTINCT customer_unique_id) FILTER (WHERE bulan_ke = 3) AS kembali_bulan_3
FROM aktivitas
GROUP BY bulan_cohort
ORDER BY bulan_cohort;

-- pelanggan paling loyal
SELECT
  c.customer_unique_id,
  COUNT(DISTINCT o.order_id) AS jumlah_pesanan,
  ROUND(SUM(i.price)::numeric, 2) AS total_belanja
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items i ON i.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
ORDER BY jumlah_pesanan DESC, total_belanja DESC
LIMIT 10;