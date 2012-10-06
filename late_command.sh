#!/bin/bash

# Dynamic DNS
echo "key meet-lab-key {
  algorithm hmac-md5;
  secret `openssl rand -base64 16`;
};" | tee /etc/bind/meet-lab.key > /etc/dhcp/meet-lab.key

# LDAP authentication
auth-client-config -t nss -p lac_ldap
