#!/bin/bash
set -eo pipefail
function do_err() {
    code=$?
    echo "Command failed with code $code: $BASH_COMMAND"
    exit $code

}
trap do_err ERR

source /scripts/base-image/variable.sh
set -x

#TODO: check whether it is required or not ?
apt-get clean
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
rm -rf /etc/dpkg/dpkg.cfg.d/02apt-speedup
