# Session 4 - Hive Table Creation

## Objective

Create Hive external table on top of HDFS data.

## Table Definition

CREATE EXTERNAL TABLE customers_raw (
customer_id STRING,
customer_unique_id STRING,
customer_zip_code_prefix STRING,
customer_city STRING,
customer_state STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LOCATION '/olist'
TBLPROPERTIES ("skip.header.line.count"="1");

## Problems Encountered

Initially used:

LOCATION '/root/olist'

Hive created the table successfully but returned zero rows.

## Root Cause

The HDFS file was stored in:

/olist

But Hive was looking at:

/root/olist

## Resolution

Dropped table.

Recreated table using:

LOCATION '/olist'

## Validation

DESCRIBE FORMATTED customers_raw;

SELECT COUNT(*) FROM customers_raw;

Result:

99441

## Lessons Learned

Hive tables are metadata.

The LOCATION path must point exactly to the HDFS directory containing data.

## Outcome

Hive table successfully created.

