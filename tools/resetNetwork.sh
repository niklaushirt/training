#/bin/bash

kubectl get pods -n kube-system | grep coredns | awk '{print $1}' | xargs kubectl delete pod -n kube-system


