# Session 3 - HDFS Data Ingestion

## Objective

Upload dataset into HDFS.

## Dataset

olist_customers_dataset.csv

## Steps

Copy file into container:

docker cp ~/dataset/olist_customers_dataset.csv cool_kalam:/root/

Upload into HDFS:

hdfs dfs -mkdir /olist

hdfs dfs -put /root/olist_customers_dataset.csv /olist/

Verify upload:

hdfs dfs -ls /olist

## Problems Encountered

The file appeared on the host machine but not inside the Hive container.

Hive table showed zero rows.

## Root Cause

The CSV was uploaded into a different container than the one Hive was using.

## Resolution

Copied the dataset directly into the Hive container and uploaded again into HDFS.

## Lessons Learned

- Host filesystem, container filesystem, and HDFS are different.
- Always verify file locations before creating Hive tables.

## Outcome

Dataset successfully stored in HDFS.

