#/bin/bash


sudo mv /home/training/.kube /home/training/.minikube $HOME
sudo chown -R $USER $HOME/.kube $HOME/.minikube


sudo minikube start --vm-driver=none --memory=8192 --cpus=4 --network-plugin=cni --kubernetes-version v1.17.0
