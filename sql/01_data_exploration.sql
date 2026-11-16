-- 1. Status pesanan dan jumlahnya
SELECT order_status, COUNT(*) AS jumlah
FROM orders
GROUP BY order_status
ORDER BY jumlah DESC;

-- 2. Rentang tanggal pesanan
SELECT MIN(order_purchase_timestamp) AS pertama,
       MAX(order_purchase_timestamp) AS terakhir
FROM orders;

-- 3. Pelanggan unik vs customer_id
SELECT COUNT(DISTINCT customer_id) AS jumlah_customer_id,
       COUNT(DISTINCT customer_unique_id) AS jumlah_pelanggan_unik
FROM customers;

-- 4. Jumlah kategori produk
SELECT COUNT(DISTINCT product_category_name) AS jumlah_kategori
FROM products;