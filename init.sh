#!/usr/bin/env bash

prefix=pgconf_

if [ -f $PGDATA/postgresql.conf ]; then
    pg_config=$PGDATA/postgresql.conf
else
    pg_config=/usr/share/postgresql/postgresql.conf.sample
fi

for key in $(compgen -e); do
    value=${!key}
    if [[ $key = ${prefix}* ]]; then
        config_key=`echo $key | sed -E "s/$prefix(.*)/\1/g" | sed -E "s/__/./g"`

        echo -n "Updating config: $config_key = $value ... "
        grep $config_key $pg_config &> /dev/null
        if [[ $? -eq 0 ]]; then
            echo "replaced"
            sed -Ei "s/^[#]?$config_key =.*$/$config_key = $value/g" $pg_config
        else
            echo "inserted"
            echo "$config_key = $value" >> $pg_config
        fi
    fi
done

/docker-entrypoint.sh "$@"
