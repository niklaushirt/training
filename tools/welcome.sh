#/bin/bash

./startEnvironment.sh

./training/pte/pte.sh

echo "${GREEN}--------------------------------------------------------------------------------${NC}"
echo " ${ORANGE}    Waiting 15 seconds to start Kubernetes Dashboard  ${NC}"
sleep 15
minikube dashboard > /dev/null &

