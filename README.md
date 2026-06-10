# Hadoop Hive E-Commerce Analytics

## Overview

This project demonstrates an end-to-end Big Data analytics workflow using Hadoop HDFS and Apache Hive on the Olist Brazilian E-Commerce dataset.

The objective was to understand how data moves from local storage into HDFS, becomes queryable through Hive, and can be transformed into business insights suitable for dashboard development.

---

## Technologies Used

* Docker
* Hadoop 2.7.4
* HDFS
* Apache Hive 2.3.0
* YARN
* HiveQL

---

## Architecture

![Project Architecture](screenshots/architecture.png)

### Data Flow

```text
Local CSV Files
       ↓
Docker Container
       ↓
HDFS Storage Layer
       ↓
Hive External Tables
       ↓
HiveQL Business Queries
       ↓
Business Insights Dashboard
```

The architecture illustrates how raw e-commerce CSV datasets are ingested into HDFS, exposed through Hive External Tables, analyzed using HiveQL, and transformed into business-ready insights.

---

## Dataset

### Olist Brazilian E-Commerce Dataset

Datasets Used:

* Customers Dataset
* Orders Dataset

Source:

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## Project Workflow

### 1. Hadoop Cluster Setup

* Deployed a Hadoop cluster using Docker containers
* Verified NameNode, DataNode, ResourceManager, and NodeManager services
* Confirmed cluster health using Hadoop utilities

### 2. Hive Configuration

* Installed and configured Apache Hive
* Initialized and repaired Hive Metastore
* Connected Hive with HDFS and YARN

### 3. Data Ingestion

* Copied datasets from local machine into Docker containers
* Uploaded CSV files into HDFS
* Verified successful ingestion

### 4. Hive Data Warehouse

* Created Hive External Tables
* Defined schemas for customer and order datasets
* Queried data directly from HDFS

### 5. Business Analytics

* Performed aggregation and analytical queries using HiveQL
* Generated business-ready insights for reporting and dashboard development

---

## Hive Tables

### customers_raw

```sql
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
```

### orders_raw

```sql
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
LOCATION '/olist/orders'
TBLPROPERTIES ("skip.header.line.count"="1");
```

---

## Business Analysis

### Top Customer States

```sql
SELECT customer_state,
       COUNT(*) AS customer_count
FROM customers_raw
GROUP BY customer_state
ORDER BY customer_count DESC
LIMIT 10;
```

### Result

![Customer State Analysis](screenshots/analysis.png)

### Key Findings

| State | Customer Count |
| ----- | -------------: |
| SP    |         41,746 |
| RJ    |         12,852 |
| MG    |         11,635 |
| RS    |          5,466 |
| PR    |          5,045 |

Total customer records processed: **99,441**

---

## Challenges Faced

### Hive Metastore Failure

Issue:

```text
Version information not found in metastore
```

Resolution:

* Diagnosed schema corruption using SchemaTool
* Removed incomplete Derby Metastore
* Reinitialized Hive Metastore
* Successfully restored Hive functionality

### HDFS Data Visibility Issue

Issue:

* Hive tables returned zero records despite successful table creation

Resolution:

* Verified HDFS file locations
* Confirmed dataset upload into HDFS
* Corrected table LOCATION mapping
* Recreated external tables

---

## Learning Outcomes

Through this project I gained practical experience with:

* Hadoop ecosystem fundamentals
* HDFS storage and management
* Hive data warehousing concepts
* Hive External Tables
* HiveQL analytics
* Docker-based Hadoop deployment
* Distributed system troubleshooting
* Data engineering workflow design

---

## Project Structure

```text
Hadoop-Hive-Ecommerce-Analytics/
│
├── hive/
│   ├── customers_table.sql
│   ├── orders_table.sql
│   └── business_queries.sql
│
├── journal/
│   ├── session-1-hadoop-setup.md
│   ├── session-2-hive-metastore-debugging.md
│   ├── session-3-hdfs-data-ingestion.md
│   ├── session-4-hive-table-creation.md
│   └── session-5-business-analysis.md
│
├── screenshots/
│   ├── architecture.png
│   ├── analysis.png
│   └── jps.png
│
└── README.md
```

---

## Future Improvements

* Build Power BI Dashboard
* Add Apache Spark processing
* Extend analysis using additional Olist datasets
* Automate ingestion pipelines

---

## Author

**Vikamuhan Reddy**

Learning Project focused on Hadoop, Hive, HDFS, and Big Data Analytics.
