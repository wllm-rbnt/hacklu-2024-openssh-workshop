#!/bin/bash

private_subnet=$(sudo docker network inspect docker_private_net | jq -r '.[0].IPAM.Config[0].Subnet')
private_bridge=$(ip -j r get ${private_subnet//\/24/} | jq -r '.[0].dev')

echo "Isolating private subnet ${private_subnet} (bridge ${private_bridge})"

sudo iptables -A INPUT -i ${private_bridge} -j DROP
sudo iptables -A OUTPUT -o ${private_bridge} -j DROP

