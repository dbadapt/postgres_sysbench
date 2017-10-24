# dbpercona/postgres_sysbench - Docker Sysbench compiled for PostgreSQL

Author: David Bennett - david . bennett at percona . com

## Quickstart

Run a postgres instance:

```
docker run -d -it \
  --name postgres \
  -e POSTGRES_PASSWORD=password postgres
```

Run sysbench oltp_read_write with 4 threads for 60 seconds:

```
docker run -ti \
  --net=container:postgres \
  --name postgres_sysbench \
  -e PGPASSWORD=password \
  -e SYSBENCH_THREADS=4 \
  -e SYSBENCH_TIME=60 \
  dbpercona/postgres_sysbench:latest ./run_sysbench.sh
```

Take a look at the run_sysbench.sh for other variables you can pass.

