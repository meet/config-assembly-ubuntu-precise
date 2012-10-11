#!/bin/bash

# Configuration files
REPO=config-assembly-ubuntu-precise
( cd / \
  && git clone --no-checkout https://github.com/meet/$REPO.git \
  && mv $REPO/.git / \
  && git checkout --force \
  && rm -rf $REPO \
  && git config status.showUntrackedFiles no )

# LDAP authentication
auth-client-config -t nss -p lac_ldap

# Dynamic DNS
echo "key meet-lab-key {
  algorithm hmac-md5;
  secret `openssl rand -base64 16`;
};" | tee /etc/bind/meet-lab.key > /etc/dhcp/meet-lab.key

# DNS zones
for db in /var/lib/bind/db.*.orig; do cp $db ${db/.orig/}; done

# Firewall
ufw allow from 192.168.30.0/24 to 192.168.30.1

# Home directories on server
pam-auth-update --package

# sudo
chmod 440 /etc/sudoers.d/*

# Run periodic tasks once
for cron in /etc/cron.*/meet-*; do $cron; done
