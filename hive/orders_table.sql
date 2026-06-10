CREATE EXTERNAL TABLE orders_raw (
order_id STRING,
customer_id STRING,
order_status STRING,
order_purchase_timestamp STRING,
order_approved_at STRING,
order_delivered_carrier_date STRING,
order_delivered_customer_date STRING,
order_estimated_delivery_date STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/orders'
TBLPROPERTIES ("skip.header.line.count"="1");
