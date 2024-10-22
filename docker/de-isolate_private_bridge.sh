#!/bin/bash

private_subnet=$(sudo docker network inspect docker_private_net | jq -r '.[0].IPAM.Config[0].Subnet')
private_bridge=$(ip -j r get ${private_subnet//\/24/} | jq -r '.[0].dev')

echo "De-isolating private subnet ${private_subnet} (bridge ${private_bridge})"

rulenum=$(sudo iptables -vnL INPUT --lin | grep DROP | grep ${private_bridge} | awk '{print $1}' | head -n 1)
while [ ! -z ${rulenum} ]; do
    sudo iptables -D INPUT ${rulenum}
    rulenum=$(sudo iptables -vnL INPUT --lin | grep DROP | grep ${private_bridge} | awk '{print $1}' | head -n 1)
done

rulenum=$(sudo iptables -vnL OUTPUT --lin | grep DROP | grep ${private_bridge} | awk '{print $1}' | head -n 1)
while [ ! -z ${rulenum} ]; do
    sudo iptables -D OUTPUT ${rulenum}
    rulenum=$(sudo iptables -vnL OUTPUT --lin | grep DROP | grep ${private_bridge} | awk '{print $1}' | head -n 1)
done
