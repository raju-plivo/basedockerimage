#!/bin/bash
set -eo pipefail

function do_err() {
    code=$?
    echo "Command failed with code $code: $BASH_COMMAND"
    exit $code

}
trap do_err ERR

time_zone=${TIME_ZONE:-"Etc/UTC"}
if [ -f /etc/timezone ] && [ `cat /etc/timezone|wc -l` -eq 1 ] && [ `cat /etc/timezone |sed 's/ *$//g'` == "$time_zone" ]; then
	echo "Timezone already configured !"
else
	echo "--> configuring timezone ${time_zone}..."
	echo "$time_zone" > /etc/timezone ;\
    	    rm -f /etc/localtime ;\
 	    ln -sf /usr/share/zoneinfo/$time_zone  /etc/localtime
fi
