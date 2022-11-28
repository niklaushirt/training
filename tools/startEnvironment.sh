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
echo " ${CYAN}    🐳 Starting up Docker Portainer${NC}"
docker volume create portainer_data > /dev/null
docker run -d -p 9000:9000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer > /dev/null


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    🖥️ Starting up your Minikube  ${NC}"
#minikube start
#minikube start --memory=6000 --cpus=4 --network-plugin=cilium  --kubernetes-version v1.25.3
minikube start --memory=6000 --cpus=4  --kubernetes-version v1.25.3

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    ®️ Creating Registry  ${NC}"
kubectl apply -f ./training/tools/kube-registry.yaml > /dev/null
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000  > /dev/null &

# echo "${GREEN}--------------------------------------------------------------------------------${NC}"
# echo " ${CYAN}    🌏 Creating CNI Cilium  ${NC}"
# kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.9.11/install/kubernetes/quick-install.yaml > /dev/null


echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo " ${GREEN}${healthy} Startup done....${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
