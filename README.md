# Summary

This docker-compose is to start an instance of S64 DA or PSQL or both.


# Prerequisites

- Python 3.6 or higher
- docker-compose


# Start an instance or multiple instances

1. Before starting an instance, revisit the `.env` file and apply necessary
   changes as noted in the file itself. If you want to run both databases at
   the same time, the ports they listen on must differ.

2. Apply any PG configuration changes to `files/postgresql.conf`. This file
   will be copied on database startup once.

3. To start a database instance, call `docker-compose` accordingly:

   - S64 DA on Intel PAC: `docker-compose -f docker-compose-s64da-pac up`
   - S64 DA on Xilinx Alveo `docker-compose -f docker-compose-s64da-xilinx up`
   - Native PostgreSQL: `docker-compomse -f docker-compose-psql up`
