# Summary

Swarm64 DA Docker Compose will assist in starting an instance of S64 DA or native PSQL.
Once the instance is up and running you can connect through a psql client or run
a benchmark using the [Swarm64 DA Benchmark Toolkit](https://github.com/swarm64/s64da-benchmark-toolkit).

Important notice: In order to guarantee compatibility between S64 DA and
s64da-compose, please checkout the GIT Tag that corresponds to your version of S64 DA.
For example, if your version of S64 DA is 5.0.0-beta, clone this repository and execute
`git checkout v5.0.0-beta` within the the repository root folder before proceeding.

# Prerequisites

- Python 3.6 or higher
- docker-compose (eg. use: python3 -m pip install docker-compose)


# Start an instance or multiple instances

1. Before starting an instance, revisit the `.env` file and apply necessary
   changes as noted in the file itself. In particular, pay attention the the
   Swarm64 DA version and the data directories. If you want to run both
   databases at the same time, the ports they listen on must differ.

2. Copy your S64 DA license file into the `/license` directory and rename it
   to `s64da.license`. Replace the existing dummy license file. If you don't
   have a license file yet request one by contacting support@swarm64.com.

3. (Optional) Apply any PG configuration changes to `configs/pg.env` and/or
   `configs/s64da.env`. Each setting must be prefixed with `pgconf_` in order
   to be picked up. Changing a value with an existing data directory will cause
   the config keys to be updated. The suffix following `pgconf_` before `=`
   must match a key in postgresql.conf. If you have to put a config key with a
   dot replace the `.` with `__`. For instance, `a.b=c` becomes:
   `pgconf_a__b=c`.

   The provided default configuration is suited to run benchmarks up to 1TB worth
   of data and 384GB of system RAM.

4. To start a database instance, call `docker-compose` accordingly:

   - S64 DA CPU accelerated: `docker-compose -f docker-compose-base.yml -f docker-compose-s64da-cpu.yml up`
   - Native PostgreSQL: `docker-compose -f docker-compose-base.yml -f docker-compose-psql.yml up`

6. Connect to the instance: `psql -h localhost -U postgres` (optional: -p {PORT} if other than 5432)

7. Ingest data or run a benchmark for example with the [Swarm64 DA Benchmark Toolkit](https://github.com/swarm64/s64da-benchmark-toolkit)
