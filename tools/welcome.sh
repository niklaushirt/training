#/bin/bash

cd ./training
git checkout origin/master -f
git checkout master -f 
git pull origin master
cd


./training/tools/startEnvironment.sh

./training/pte/pte.sh

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Waiting 15 seconds to start Kubernetes Dashboard  ${NC}"
sleep 15
minikube dashboard > /dev/null &

