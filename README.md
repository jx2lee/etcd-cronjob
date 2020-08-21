# Etcd Snapshot in Kubernetes
This repo is periodically save etcd snapshots in kubernetes cluster. It was written shell and usage is as follows.

# How to Use
```bash
$ ./setup.sh
Usage   : ./setup.sh {registry_endpoint} {node_name}
Example : ./setup.sh 192.168.179.185:5000 k8s-master
```  
Enter the docker registry endpoint and the node you want to save the snapshot (`select from the master nodes`). If you want change **crontab_expression**, modify *schedule: "0 6 * * *"* in `etcd_snapshot.yaml.template` file.  
```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: etcd-backup
  namespace: kube-system
spec:
  schedule: "0 6 * * *" #############
  jobTemplate:
```


---
made by *jaejun.lee*