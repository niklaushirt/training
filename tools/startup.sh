#/bin/bash



sudo minikube start --vm-driver=none --memory=8192 --cpus=4 --network-plugin=cni --kubernetes-version v1.17.0

sleep 120

sudo mv /home/training/.kube /home/training/.minikube $HOME
sudo chown -R $USER $HOME/.kube $HOME/.minikube

sudo chown -R $USER ~/.kube ~/.minikube

minikube dashboard &

kubectl patch service -n kubernetes-dashboard kubernetes-dashboard -p '{"spec": {"ports": [{"nodePort": 31719,"port": 80}],"type": "NodePort"}}'


