#/bin/bash

sudo minikube start --vm-driver=none --memory=8192 --cpus=4 --network-plugin=cni --kubernetes-version v1.17.0
