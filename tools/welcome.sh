#/bin/bash

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Updating Training Files  ${NC}"

cd ./training
git checkout origin/master -f
git checkout master -f 
git pull origin master
cd

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Start Training Content  ${NC}"

firefox https://niklaushirt.github.io/k8s_training_web/ &


echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Start Training Environment  ${NC}"
./training/tools/startEnvironment.sh

# ./training/pte/pte.sh

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Waiting 15 seconds to start Kubernetes Dashboard  ${NC}"
sleep 15
minikube dashboard > /dev/null &

