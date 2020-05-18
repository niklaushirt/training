#/bin/bash
docker start portainer
minikube start

echo "Create Registry"
kubectl apply -f ./training/tools/kube-registry.yaml
kubectl port-forward --namespace kube-system $(kubectl get po -n kube-system | grep kube-registry-v0 | \awk '{print $1;}') 5000:5000  > /dev/null&
echo "Create CNI Cilium"
kubectl create -f https://raw.githubusercontent.com/cilium/cilium/v1.6/install/kubernetes/quick-install.yaml

echo "Waiting 1 minute to start Kubernetes Dashboard"
sleep 60
minikube dashboard &

echo "Cleaning up"
kubectl get pods -n kube-system | grep -E "(Terminating|CrashLoopBackOff)" | awk '{print $1}' | xargs kubectl delete pod -n kube-system --force --grace-period=0