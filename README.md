# Hadoop Hive E-Commerce Analytics

## Overview

This project demonstrates an end-to-end Big Data analytics workflow using:

- Docker
- Hadoop HDFS
- Apache Hive
- Olist E-Commerce Dataset

The objective was to learn how data moves from local storage into HDFS, becomes queryable through Hive, and can be transformed into business insights for dashboard development.

---

## Architecture

Local CSV Files
↓
Docker Container
↓
HDFS Storage
↓
Hive External Tables
↓
Business Queries
↓
Dashboard

---

## Dataset

- Olist Customers Dataset
- Olist Orders Dataset

Source:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## Technologies

- Docker
- Hadoop 2.7.4
- Hive 2.3.0
- HDFS
- Tez
- YARN

---

## Project Workflow

1. Setup Hadoop Cluster using Docker
2. Configure Hive
3. Fix Hive Metastore Issues
4. Upload CSV files to HDFS
5. Create Hive External Tables
6. Execute Business Queries
7. Build Dashboard

---

## Results

Successfully queried:

- 99,441 customers
- Customer distribution by state
- Business-ready analytics data

