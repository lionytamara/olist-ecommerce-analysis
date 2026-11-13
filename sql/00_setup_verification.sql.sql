SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

SELECT COUNT(*) FROM geolocation;

SELECT COUNT(*) FROM olist_order_items_dataset;
SELECT COUNT(*) FROM olist_order_reviews_dataset;
SELECT COUNT(*) FROM olist_order_payments_dataset;
DROP TABLE olist_orders_dataset;


SELECT 'customers' AS tabel, COUNT(*) AS jumlah FROM customers
UNION ALL SELECT 'geolocation', COUNT(*) FROM geolocation;

SELECT COUNT(*) FROM olist_orders_dataset;
ALTER TABLE olist_orders_dataset RENAME TO orders;

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;


