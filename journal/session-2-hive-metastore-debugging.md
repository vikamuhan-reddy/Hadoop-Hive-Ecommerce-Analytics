# Session 2 - Hive Metastore Debugging

## Objective

Make Hive operational.

## Problems Encountered

### Hive failed to start

Error:

Version information not found in metastore

### HiveServer2 failed

Connection refused

### Metastore schema corrupted

VERSION table does not exist

## Investigation

Commands Used:

jps

schematool -dbType derby -info

find /usr/local -type d -name metastore_db

## Root Cause

The Derby metastore was partially initialized and became inconsistent.

## Resolution

Backup old metastore:

mv metastore_db metastore_old_db

Initialize fresh schema:

schematool -initSchema -dbType derby

## Lessons Learned

- Hive depends on Metastore.
- Corrupted schema prevents startup.
- Reading logs is essential.

## Outcome

Hive started successfully.

