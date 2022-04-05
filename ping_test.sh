#!/bin/bash

ping -c1 -W1 -q 10.100.100.2 &>/dev/null
status=$( echo $? )

if [[ $status == 0 ]]; then
    echo "host is online"
else
    echo "host is offline"
fi
