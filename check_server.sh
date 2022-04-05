#!/bin/bash

echo "--------------------"
date
echo "--------------------"

for server in 10.100.100.2 10.100.100.97 10.100.100.52; do
    ping -c1 -W1 -q $server &>/dev/null
    status=$( echo $? )

    if [[ $status != 0 ]]; then
        echo "$server is offline"
        ipmitool -H 192.168.5.89 -U ADMIN -P '$PASSWORD' chasis power cycle
        break
    fi
done
