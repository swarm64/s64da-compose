#!/bin/bash

CWD=/docker-entrypoint-initdb.d
PG_CONFIG=$PGDATA/postgresql.conf
cp -f $CWD/postgresql.conf $PG_CONFIG

found_plugin=$(find /usr/lib -name swarm64da.so | wc -l)
if [ $found_plugin -gt 0 ]; then
    cat $CWD/postgresql.conf.s64da >> $PG_CONFIG
fi
