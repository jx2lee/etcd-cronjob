#!/bin/bash
# Script to modify etcd_snapshot.yaml on your envinonment
# Tue, 17.06.2020
# jaejun.lee.1991@gmail.com


if  [ "$#" -ne 2 ]; then
	echo "Usage   : ./script.sh {registry_endpoint} {master_node}"
	echo "Example : ./script.sh 192.168.179.185:5000 k8s-master"
	exit 0
fi

registry_endpoint=$1
master_node=$2

sed -i 's/{registry_endpoint}/'$registry_endpoint'/g' etcd_snapshot.yaml
sed -i 's/{master_node}/'$master_node'/g' etcd_snapshot.yaml
