
sudo apt install nfs-kernel-server -y

sudo mkdir -p /storage/nfs
sudo chown -R nobody:nogroup /storage/nfs
sudo chmod 777 /storage/nfs
echo "/storage/nfs *(rw,sync,no_root_squash,no_subtree_check)" | sudo tee --append /etc/exports
sudo exportfs -a
sudo systemctl restart nfs-kernel-server

minikube ssh "sudo apt update && sudo apt install nfs-common -y"
minikube ssh "echo '192.168.122.1   ubuntu' | sudo tee --append /etc/hosts"

kubectl apply -f ~/training/volumes/nfs-provisioner.yaml


kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: test-claim
spec:
  storageClassName: nfs-client
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Mi


apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: ceph-test-pvc-sc
spec:
  storageClassName: nfs-client
  accessModes:
    - ReadWriteMany 
  resources:
    requests:
      storage: 50Mi