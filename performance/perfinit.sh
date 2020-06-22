#/bin/bash

minikube delete


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Starting up your Minikube  ${NC}"
minikube start --memory=12192 --cpus=6 --network-plugin=cni  --kubernetes-version v1.17.0


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating Registry  ${NC}"
kubectl apply -f ./training/tools/kube-registry.yaml > /dev/null
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000  > /dev/null &

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating CNI Cilium  ${NC}"
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.6/install/kubernetes/quick-install.yaml > /dev/null


sudo sysctl -w vm.max_map_count=262144
ulimit -n 65535

sudo apt install python3-pip
pip3 install locust

