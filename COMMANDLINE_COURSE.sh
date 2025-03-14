git clone https://github.com/niklaushirt/training.git
cd training


#############################################################################################
## BUILD

cd /Users/nhirt/TEMP/training
cd demo-app/k8sdemo/
bat ./Dockerfile


podman build -t myimage:1.0.0 .
podman images 


#############################################################################################
## PODMAN

podman context ls

podman --connection podman-machine-default-root run \
    --rm \
    --privileged \
    --detach \
    --name portainer \
    -v portainer_data:/data \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p 9443:9443 \
    -p 8000:8000 \
    portainer/portainer-ce

https://localhost:9443

podman --connection podman-machine-default-root kill portainer

#############################################################################################
## RUN

podman run --rm -ti myimage:1.0.0 /bin/bash
uname -a


podman run --rm -ti -e MYVAR=foo -p 8080:3000 myimage:1.0.0

http://localhost:8080

podman ps [-a]

podman stop/kill <CONTAINER_ID>



#############################################################################################
## REGISTRY

podman login quay.io

podman tag myimage:1.0.0 quay.io/niklaushirt/myimage:1.0.0

podman images
podman push quay.io/niklaushirt/myimage:1.0.0

podman pull docker.io/niklaushirt/myimage:latest



podman build --platform linux/arm64/v8 --platform linux/amd64 -t myimage:1.0.0 --manifest myimage-mf .
podman manifest inspect myimage-mf










#############################################################################################
#############################################################################################
#############################################################################################
#############################################################################################
## K8s

cd /Users/nhirt/TEMP/training

kubectl get nodes


#############################################################################################
## RUNNING

kubectl run nginx-demo --image=docker.io/nginx
kubectl get pods


bat ./deployment/pod.yaml
kubectl create -f ./deployment/pod.yaml
kubectl apply -f ./deployment/pod.yaml

kubectl get pods

kubectl get pods nginx -o yaml|yq

kubectl get pods
kubectl get pods -l release=april2023






#############################################################################################
## SERVICES

kubectl create -f ./deployment/service.yaml


kubectl port-forward --namespace default nginx 8000:80

http://localhost:8000


kubectl delete -f ./deployment/pod.yaml
kubectl delete pods nginx-demo


#############################################################################################
## DEPLOYMENT

bat ./deployment/deployment.yaml


kubectl apply -f ./deployment/deployment.yaml

kubectl get pods
kubectl get deployments

kubectl port-forward --namespace default $(kubectl get po -n default -l app=nginx | grep nginx | \awk '{print $1;}'|head -1) 8000:80

http://localhost:8000


#############################################################################################
## CONFIGURATION

bat ./deployment/deployment-cm.yaml

kubectl apply -f ./deployment/deployment-cm.yaml





kubectl delete -f ./deployment/deployment.yaml
kubectl delete -f ./deployment/deployment-cm.yaml

#############################################################################################
#############################################################################################
## APPLIED

https://niklaushirt.github.io/k8s_training_web/04-kubernetes-basics/04-kubernetes-basics-03

https://hub.docker.com


bat ./deployment/demoapp-backend-mac.yaml
kubectl create -f ./deployment/demoapp-backend-mac.yaml
kubectl create -f ./deployment/demoapp-backend-service.yaml


bat ./deployment/demoapp-mac.yaml
kubectl create -f ./deployment/demoapp-mac.yaml
kubectl create -f ./deployment/demoapp-service.yaml




kubectl port-forward --namespace default $(kubectl get po -n default -l app=k8sdemo | grep k8sdemo | \awk '{print $1;}') 3000:3000

http://localhost:3000

kubectl delete -f ./deployment/demoapp-backend-mac.yaml
kubectl delete -f ./deployment/demoapp-backend-service.yaml
kubectl delete -f ./deployment/demoapp-mac.yaml
kubectl delete -f ./deployment/demoapp-service.yaml



#############################################################################################
## STORAGE

kubectl get StorageClasses

bat ./volumes/1-simple-mysql-pv.yaml
kubectl apply -f ./volumes/1-simple-mysql-pv.yaml
kubectl get pv
kubectl describe pv mysql-pv-volume


bat ./volumes/2-simple-mysql-pvc.yaml
kubectl apply -f ./volumes/2-simple-mysql-pvc.yaml
kubectl get pvc


bat ./volumes/3-simple-mysql-deployment.yaml
kubectl apply -f ./volumes/3-simple-mysql-deployment.yaml
kubectl get deployment

k9s

mysql -ppassword

CREATE DATABASE testing;
show databases;
exit;


kubectl delete -f ./volumes/3-simple-mysql-deployment.yaml
kubectl delete -f ./volumes/2-simple-mysql-pvc.yaml
kubectl delete -f ./volumes/1-simple-mysql-pv.yaml









#############################################################################################
#############################################################################################
#############################################################################################
## ADVANCED


kubectl apply -f ./deployment/deployment-READY.yaml
kubectl apply -f ./deployment/deployment-LIVENESS.yaml
kubectl apply -f ./deployment/deployment-OOM.yaml
kubectl apply -f ./deployment/deployment-crashloop.yaml
kubectl apply -f ./deployment/deployment-imagepull.yaml
kubectl apply -f ./deployment/deployment-imagepull-sa.yaml



#############################################################################################
## LIMITS
bat ./deployment/deployment-READY.yaml
bat ./deployment/deployment-LIVENESS.yaml



#############################################################################################
## PROBES
bat ./deployment/deployment-OOM.yaml



#############################################################################################
## DEBUG
bat ./deployment/deployment-crashloop.yaml
bat ./deployment/deployment-imagepull.yaml
bat ./deployment/deployment-imagepull-sa.yaml









#############################################################################################
## CLEAN-UP

kubectl delete -f ./deployment/deployment-crashloop.yaml
kubectl delete -f ./deployment/deployment-imagepull.yaml
kubectl delete -f ./deployment/deployment-imagepull-sa.yaml
kubectl delete -f ./deployment/deployment-OOM.yaml
kubectl delete -f ./deployment/deployment-READY.yaml
kubectl delete -f ./deployment/deployment-LIVENESS.yaml


kubectl delete -f ./volumes/3-simple-mysql-deployment.yaml
kubectl delete -f ./volumes/2-simple-mysql-pvc.yaml
kubectl delete -f ./volumes/1-simple-mysql-pv.yaml
kubectl delete -f ./deployment/demoapp-backend-mac.yaml
kubectl delete -f ./deployment/demoapp-backend-service.yaml
kubectl delete -f ./deployment/demoapp-mac.yaml
kubectl delete -f ./deployment/demoapp-service.yaml
kubectl delete -f ./deployment/deployment.yaml
kubectl delete -f ./deployment/deployment-cm.yaml
kubectl delete -f ./deployment/pod.yaml
kubectl delete pods nginx-demo
kubectl delete pods nginx
podman --connection podman-machine-default-root kill portainer











kubectl debug $(kubectl get po -n default -l app=crashloop --no-headers| \awk '{print $1;}') -it --copy-to=my-debugger --container=mycontainer -- sh

kubectl debug $(kubectl get po -n default -l app=crashloop --no-headers| \awk '{print $1;}') -it --image=busybox
kubectl debug $(kubectl get po -n default -l app=crashloop --no-headers| \awk '{print $1;}') -it --image=busybox --copy-to=my-debugger

kubectl debug $(kubectl get po -n default -l app=crashloop --no-headers| \awk '{print $1;}') -it --image=busybox



