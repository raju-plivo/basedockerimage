#!/bin/bash
set -eo pipefail

sed -i 's/PermitRootLogin\ without-password/PermitRootLogin\ no/' /etc/ssh/sshd_config
mkdir -p /var/run/sshd
