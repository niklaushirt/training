#/bin/bash

cd ./training
git checkout origin/master -f
git checkout master -f 
git pull origin master
cd


./training/tools/startEnvironment.sh

# ./training/pte/pte.sh
firefox https://niklaushirt.github.io/k8s_training_web/


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Waiting 15 seconds to start Kubernetes Dashboard  ${NC}"
sleep 15
minikube dashboard > /dev/null &

