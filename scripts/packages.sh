#!/bin/bash
set -e
source /scripts/base-image/variable.sh
## Often used tools.
echo 'APT::Get::Assume-Yes "true";' > /etc/apt/apt.conf.d/90forceyes
echo 'deb http://archive.ubuntu.com/ubuntu trusty main universe restricted' > /etc/apt/sources.list
echo 'deb http://archive.ubuntu.com/ubuntu trusty-updates  main universe restricted' >> /etc/apt/sources.list
apt-get update -qq
$minimal_apt_get_install openssh-server supervisor curl python-pip language-pack-en wget vim unzip zip jq
pip install envtpl
/bin/bash /scripts/base-image/cleanup.sh
