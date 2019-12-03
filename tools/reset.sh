#/bin/bash

echo "Fix minikube permissions"
~/training/tools/own.sh 

echo "Reset K8s DNS"
kubectl delete pods -l k8s-app=kube-dns -n kube-system


