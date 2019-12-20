# Summary

Swarm64 DA Docker Compose will assist to start instance of S64 DA or native PSQL.
Once the instance is up and running you can connect through a psql client or run
a benchmark using the [Swarm64 TPC Toolkit](https://github.com/swarm64/tpc-toolkit).

# Prerequisites

- Python 3.6 or higher
- docker-compose (eg. use: python3 -m pip install docker-compose)


# Start an instance or multiple instances

1. Before starting an instance, revisit the `.env` file and apply necessary
   changes as noted in the file itself. If you want to run both databases at
   the same time, the ports they listen on must differ.

2. Apply any PG configuration changes to `configs/pg.env` and/or
   `configs/s64da.env`. Each setting must be prefixed with `pgconf_` in order
   to be picked up. Changing a value with an existing data directory will cause
   the config keys to be updated. The suffix following `pgconf_` before `=`
   must match a key in postgresql.conf. If you have to put a config key with a
   dot replace the `.` with `__`. For instance, `a.b=c` becomes:
   `pgconf_a__b=c`.

   The provided default configuration is suited to run benchmarks up to 1TB worth 
   of data and 384GB of system RAM.

3. To start a database instance, call `docker-compose` accordingly:

   - S64 DA on Intel PAC Arria10: `docker-compose -f docker-compose-s64da-pac.yml up`
   - S64 DA on Xilinx Alveo U200: `docker-compose -f docker-compose-s64da-xilinx.yml up`
   - Native PostgreSQL: `docker-compose -f docker-compose-psql.yml up`

4. Connect to the instance: `psql -h localhost -U postgres`

5. Ingest data or run a benchmark for example with the [Swarm64 TPC Toolkit](https://github.com/swarm64/tpc-toolkit)
