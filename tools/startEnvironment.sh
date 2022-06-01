#/bin/bash

echo "${GREEN}********************************************************************************${NC}"
echo " ${CYAN}    Starting up your Minikube Training Environment  ${NC}"
echo " ${CYAN}    ---------------------------------------------  ${NC}"
echo " ${NC}    Don't worry if there are some errors displayed   ${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo "  "
echo "  "
echo "  "


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Starting up Docker Portainer${NC}"
docker start portainer > /dev/null

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Starting up your Minikube  ${NC}"
minikube delete
minikube start --memory=6000 --cpus=4 --network-plugin=cni  --kubernetes-version v1.24.0


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating Registry  ${NC}"
kubectl apply -f ./training/tools/kube-registry.yaml > /dev/null
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000  > /dev/null &

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating CNI Cilium  ${NC}"
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.9.11/install/kubernetes/quick-install.yaml > /dev/null


echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo " ${GREEN}${healthy} Startup done....${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
