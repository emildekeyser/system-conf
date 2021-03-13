#!/bin/sh

if nmcli device status | grep -Pq 'ethernet\s*connected'
then
    # nmcli radio wifi off
    nmcli radio all off
else
    nmcli radio all on
fi
