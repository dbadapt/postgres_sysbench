#!/bin/bash

for t in $(seq 1 100) 
do
  psql -hlocalhost -Upostgres -c "drop table sbtest${t}" > /dev/null 2>&1  
done

sysbench --pgsql-host=${PGSQL_HOST:-localhost} \
         --pgsql-user=${PGSQL_USER:-postgres} \
         --pgsql-password=${PGPASSWORD:-${PGSQL_PASSWORD:-password}} \
         --pgsql-db=${PGSQL_DB:-postgres} \
         /usr/local/share/sysbench/oltp_read_write.lua prepare

sysbench --pgsql-host=${PGSQL_HOST:-localhost} \
         --pgsql-user=${PGSQL_USER:-postgres} \
         --pgsql-password=${PGPASSWORD:-${PGSQL_PASSWORD:-password}} \
         --pgsql-db=${PGSQL_DB:-postgres} \
         --threads=${SYSBENCH_THREADS:-1} \
         --time=${SYSBENCH_TIME:-60} \
         /usr/local/share/sysbench/oltp_read_write.lua run

