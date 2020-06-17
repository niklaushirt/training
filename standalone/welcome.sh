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
echo " ${CYAN}    Starting up Docker Portainer ${NC}"
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Starting up your Minikube  ${NC}"
minikube start --memory=8192 --cpus=4 --network-plugin=cni  --kubernetes-version v1.17.0


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating Registry  ${NC}"
kubectl apply -f ../tools/kube-registry.yaml > /dev/null
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000  > /dev/null &

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${CYAN}    Creating CNI Cilium  ${NC}"
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.6/install/kubernetes/quick-install.yaml > /dev/null


echo "${GREEN}********************************************************************************${NC}"
echo " ${GREEN}${healthy} Environment done....${NC}"
echo "${GREEN}********************************************************************************${NC}"


echo "${GREEN}********************************************************************************${NC}"
echo " ${CYAN}    Setting up your Personal Training Environment (PTE) $DO_NAM ${NC}"
echo " ${CYAN}    --------------------------------------------- $DO_NAM ${NC}"
echo " ${NC}    The following steps will create your web-based Personal Training Environment $DO_NAM ${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo "  "
echo "  "
echo "  "
echo " ${CYAN} Preparing your Personal Training Environment${NC}"

        kubectl apply -f fscollector_deploy_ready.yaml


        FOUND=0
        echo "${clock} Wait for Personal Training Environment to reach running state."
        while [ ${FOUND} -eq 0 ]; do
          FOUND=$(kubectl get pods | grep student | grep 1/1 | grep -c "")
          echo "${clock} Still waiting for Personal Training Environment to reach running state. This can take some time...."
          sleep 10 
        done 

        minikube service student-ui

echo "${GREEN}********************************************************************************${NC}"
echo " ${GREEN}${healthy} Personal Training Environment done....${NC}"
echo "${GREEN}********************************************************************************${NC}"




echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Waiting 15 seconds to start Kubernetes Dashboard  ${NC}"
sleep 15
minikube dashboard > /dev/null &

echo " ${ORANGE}    Hit ENTER several times to get your prompt back.....  ${NC}"




echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo " ${GREEN}${healthy} Startup done....${NC}"
echo "${GREEN}********************************************************************************${NC}"
echo "${GREEN}********************************************************************************${NC}"
