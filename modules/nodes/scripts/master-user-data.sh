#!/bin/bash

NEW_HOSTNAME="spot-k8s-master"

hostnamectl set-hostname "$NEW_HOSTNAME"

sed -i "s/127.0.1.1.*/127.0.1.1 $NEW_HOSTNAME/" /etc/hosts

echo "Hostname changed to $NEW_HOSTNAME"