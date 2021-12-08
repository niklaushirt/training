#/bin/bash

echo "********************************************************************************"
echo "  🚀  Starting up your Minikube Training Environment  "
echo "     ---------------------------------------------  "
echo "     Don't worry if there are some errors displayed   "
echo "********************************************************************************"
echo "  "
echo "  "
echo "  "


echo "--------------------------------------------------------------------------------"
echo "     Starting up Docker Portainer (if there is an error that protainer already exists, just ignore it) "
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer



echo "--------------------------------------------------------------------------------"
echo "     Creating Registry  "
kubectl apply -f ../tools/kube-registry.yaml > /dev/null
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000  > /dev/null &

echo "--------------------------------------------------------------------------------"
echo "     Creating CNI Cilium  "
# kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.6/install/kubernetes/quick-install.yaml > /dev/null




echo "--------------------------------------------------------------------------------"
echo "     Waiting 15 seconds to start Kubernetes Dashboard  "
sleep 15
minikube dashboard > /dev/null &

echo "********************************************************************************"
echo " ✅ Environment done...."
echo "********************************************************************************"


echo "     Hit ENTER several times to get your prompt back.....  "


echo "********************************************************************************"
echo " 🌏 Manually open Training Environment"
echo "********************************************************************************"
echo "  Please open the following URL in the Browser of your choice "
echo "     https://niklaushirt.github.io/k8s_training_web/  "



echo "********************************************************************************"
echo "********************************************************************************"
echo " ✅ Startup done...."
echo "********************************************************************************"
echo "********************************************************************************"
