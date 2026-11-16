SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orders' AND column_name LIKE 'order_%'
ORDER BY ordinal_position;

ALTER TABLE orders
  ALTER COLUMN order_purchase_timestamp TYPE timestamp USING NULLIF(order_purchase_timestamp, '')::timestamp,
  ALTER COLUMN order_approved_at TYPE timestamp USING NULLIF(order_approved_at, '')::timestamp,
  ALTER COLUMN order_delivered_carrier_date TYPE timestamp USING NULLIF(order_delivered_carrier_date, '')::timestamp,
  ALTER COLUMN order_delivered_customer_date TYPE timestamp USING NULLIF(order_delivered_customer_date, '')::timestamp,
  ALTER COLUMN order_estimated_delivery_date TYPE timestamp USING NULLIF(order_estimated_delivery_date, '')::timestamp;