#/bin/bash

./startEnvironment.sh

./training/pte/pte.sh

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Waiting 1 minute to start Kubernetes Dashboard  ${NC}"
sleep 60
minikube dashboard > /dev/null &

