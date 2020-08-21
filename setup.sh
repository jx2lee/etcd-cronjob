#!/bin/bash
# Script to modify etcd_snapshot.yaml on your envinonment
# Tue, 21.08.2020
# jaejun.lee.1991@gmail.com


if  [ "$#" -ne 2 ]; then
	echo "Usage   : $0 {registry_endpoint} {node_name}"
	echo "Example : $0 192.168.179.185:5000 k8s-master"
	exit 0
fi

registry_endpoint=$1
node_name=$2

cp $(pwd -P)/etcd_snapshot.yaml.template $(pwd -P)/etcd_snapshot.yaml

sed -i 's/{registry_endpoint}/'$registry_endpoint'/g' etcd_snapshot.yaml
sed -i 's/{node_name}/'$node_name'/g' etcd_snapshot.yaml

kubectl apply -f $(pwd -P)/etcd_snapshot.yaml
