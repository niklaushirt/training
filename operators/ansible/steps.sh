

cd
mkdir ansible-operator
cd ~/ansible-operator 


operator-sdk new demo-operator-frontend --type=ansible --api-version=lab.ibm.com/v1beta1 --kind=MyLabDemo 

cd ~/ansible-operator/lab-operator 

operator-sdk build niklaushirt/lab-operator:ansible
docker push niklaushirt/lab-operator:ansible


sed -i 's|REPLACE_IMAGE|niklaushirt/lab-operator:ansible|g'  ~/ansible-operator/lab-operator/deploy/operator.yaml

kubectl create -f  ./deploy/crds/lab_v1beta1_mylabdemo_crd.yaml 
kubectl create -f  ./deploy/service_account.yaml
kubectl create -f  ./deploy/role.yaml
kubectl create -f  ./deploy/role_binding.yaml
kubectl create -f  ./deploy/operator.yaml

kubectl create -f  ./deploy/crds/lab_v1beta1_mylabdemo_cr.yaml


kubectl delete -f  ./deploy/crds/lab_v1beta1_mylabdemo_crd.yaml 
kubectl delete -f  ./deploy/service_account.yaml
kubectl delete -f  ./deploy/role.yaml
kubectl delete -f  ./deploy/role_binding.yaml
kubectl delete -f  ./deploy/operator.yaml

kubectl delete -f  ./deploy/crds/lab_v1beta1_mylabdemo_cr.yaml






