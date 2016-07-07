#!/bin/bash
set -eo pipefail

function do_err() {
    code=$?
    echo "Command failed with code $code: $BASH_COMMAND"
    exit $code

}
trap do_err ERR

## Adding user for WME application.
user="baseimage"
user=${SSH_USER:-"basedockerimage"}
if [ ! `id -u $user > /dev/null 2>&1`]; then
	useradd -s /bin/bash -m -d /home/$user $user
	cd /home/$user && mkdir .ssh && chmod 700 .ssh && chown -R $user:$user .ssh
	sudo adduser $user sudo
	echo "$user ALL=NOPASSWD: ALL">>/etc/sudoers
else
	echo "$user user already added!"
fi

## Setting up ssh password for basedockerimage user
#TODO: check the password value too or force set the password
if [ ! `grep -q '^${user}:' /etc/shadow` ]; then
	ssh_password=${SSH_PASSWORD:-"baseimage"}
	echo "--> configuring $user password ${ssh_password}..."
	echo "$user:$ssh_password" | chpasswd
else
	echo "--> $user password already configured !"
fi
