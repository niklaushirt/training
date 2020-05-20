#/bin/bash


echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo ""
echo " ${ORANGE}${rocket} Kubernetes Workshop Series ${NC}"
echo ""
echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo " ${CYAN}    Starting up your Minikube Training Environment  ${NC}"
echo " ${CYAN}    ---------------------------------------------  ${NC}"
echo " ${NC}    Don't worry if there are some errors displayed, this is due to   ${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo "  "
echo "  "
echo "  "


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Starting up Docker ${NC}"
docker start portainer > /dev/null

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Starting up your Minikube  ${NC}"
minikube start


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating Registry  ${NC}"
kubectl apply -f ./training/tools/kube-registry.yaml > /dev/null
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000  > /dev/null &

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating CNI Cilium  ${NC}"
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.6/install/kubernetes/quick-install.yaml > /dev/null

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Cleaning up  ${NC}"
kubectl get pods -n kube-system | grep -E "(Terminating|CrashLoopBackOff)" | awk '{print $1}' | xargs kubectl delete pod -n kube-system --force --grace-period=0


echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo " ${GREEN}${healthy} Startup done....${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
