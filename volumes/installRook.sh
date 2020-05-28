


 kubectl delete -f ~/training/volumes/ceph-block-sc.yaml
 kubectl delete -f ~/rook/cluster/examples/kubernetes/mysql.yaml
 kubectl delete -f ~/rook/cluster/examples/kubernetes/wordpress.yaml 
kubectl delete -f dashboard-external-http.yaml 
kubectl delete -f cluster-test.yaml


kubectl patch storageclass "csi-cephfs" -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'


minikube ssh "sudo mkdir -p /mnt/minikube && sudo ln -sf /mnt/minikube /var/lib/"



sudo sgdisk --zap-all /dev/sdb

minikube ssh "cd /bin && sudo curl -O https://raw.githubusercontent.com/ceph/ceph-docker/master/examples/kubernetes-coreos/rbd && sudo chmod +x /bin/rbd"
minikube ssh "rbd"

minikube ssh "sudo rm -r /mnt/sdb1/rook/*"
minikube ssh "sudo mkdir -p /mnt/sdb1/rook/ && sudo ln -sf /mnt/sdb1/rook/ /var/lib/"

git clone --single-branch --branch release-1.3 https://github.com/rook/rook.git
cd rook/cluster/examples/kubernetes/ceph
kubectl create -f common.yaml
kubectl create -f operator.yaml
echo "    deviceFilter: sdb" >> cluster-test.yaml
kubectl create -f cluster-test.yaml


kubectl apply -f dashboard-external-http.yaml 
minikube service -n rook-ceph rook-ceph-mgr-dashboard-external-http
kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo



kubectl create -f toolbox.yaml
kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') bash

kubectl -n rook-ceph exec -it $(kubectl -n rook-ceph get pod -l "app=rook-ceph-tools" -o jsonpath='{.items[0].metadata.name}') bash ceph status


kubectl apply -f dashboard-external-http.yaml 
minikube service -n rook-ceph rook-ceph-mgr-dashboard-external-http
kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo




kubectl apply -f pool-test.yaml

apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
   name: rook-ceph-block
provisioner: ceph.rook.io/block
parameters:
  pool: replicapool
  #The value of "clusterNamespace" MUST be the same as the one in which your rook cluster exist
  clusterNamespace: rook-ceph


kubectl apply -f ../mysql.yaml 




apiVersion: ceph.rook.io/v1beta1
kind: Pool
metadata:
  name: replicapool
  namespace: rook-ceph
spec:
  replicated:
    size: 3
---
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
   name: rook-ceph-block
provisioner: ceph.rook.io/block
parameters:
  pool: replicapool
  #The value of "clusterNamespace" MUST be the same as the one in which your rook cluster exist
  clusterNamespace: rook-ceph




apiVersion: v1
kind: Pod
metadata:
  name: rook-client
  namespace: rook-ceph
spec:
  containers:
  - name: rook-client
    image: quay.io/rook/rook-client:latest
    imagePullPolicy: IfNotPresent
    command: ["sleep", "36500d"]
    securityContext:
      privileged: true
    volumeMounts:
        - mountPath: /dev
          name: dev
        - mountPath: /sys
          name: sys
        - mountPath: /lib/modules
          name: libmodules
  volumes:
      - name: dev
        hostPath:
          path: /dev
      - name: sys
        hostPath:
          path: /sys
      - name: libmodules
        hostPath:
          path: /lib/modules







kubectl delete -f cluster-test.yaml
minikube ssh "sudo rm -r /mnt/sda1/rook/*"
minikube ssh "sudo mkdir -p /mnt/sda1/rook/ && sudo ln -sf /mnt/sda1/rook/ /var/lib/"

kubectl delete -f dashboard-external-http.yaml 
kubectl delete -f cluster-test.yaml
kubectl delete -f operator.yaml
kubectl delete -f common.yaml



lsblk -o NAME,FSTYPE,LABEL,SIZE,MOUNTPOINT
fdisk -l | grep '^Disk'
sudo fdisk /dev/sdb
sudo mkfs.ext4 /dev/sdb1
mkdir /home/training/test
sudo mount /dev/sdb1 /home/training/test
sudo umount /dev/sdb1


 2020-05-26 07:56:47.043767 I | inventory: skipping device "sda" because it has child, considering the child instead.                        │
│ provision 2020-05-26 07:56:47.043857 D | exec: Running command: lsblk /dev/sda1 --bytes --nodeps --pairs --paths --output SIZE,ROTA,RO,TYPE,PKNAME,NA │
│ provision 2020-05-26 07:56:47.045888 D | exec: Running command: udevadm info --query=property /dev/sda1                                               │
│ provision 2020-05-26 07:56:47.050606 D | exec: Running command: lsblk /dev/sda2 --bytes --nodeps --pairs --paths --output SIZE,ROTA,RO,TYPE,PKNAME,NA │
│ provision 2020-05-26 07:56:47.052990 D | exec: Running command: udevadm info --query=property /dev/sda2                                               │
│ provision 2020-05-26 07:56:47.056925 D | exec: Running command: lsblk /dev/sda5 --bytes --nodeps --pairs --paths --output SIZE,ROTA,RO,TYPE,PKNAME,NA │
│ provision 2020-05-26 07:56:47.059434 D | exec: Running command: udevadm info --query=property /dev/sda5                                               │
│ provision 2020-05-26 07:56:47.064544 D | exec: Running command: lsblk /dev/sdb --bytes --nodeps --pairs --paths --output SIZE,ROTA,RO,TYPE,PKNAME,NAM │
│ provision 2020-05-26 07:56:47.066657 D | exec: Running command: sgdisk --print /dev/sdb                                                               │
│ provision 2020-05-26 07:56:47.071051 D | exec: Running command: udevadm info --query=property /dev/sdb                                                │
│ provision 2020-05-26 07:56:47.076275 D | exec: Running command: lsblk --noheadings --pairs /dev/sdb                                                   │
│ provision 2020-05-26 07:56:47.078262 I | inventory: skipping device "sdb" because it has child, considering the child instead.                        │
│ provision 2020-05-26 07:56:47.078277 D | exec: Running command: lsblk /dev/sdb1 --bytes --nodeps --pairs --paths --output SIZE,ROTA,RO,TYPE,PKNAME,NA │
│ provision 2020-05-26 07:56:47.079944 W | inventory: skipping device "sdb1" because 'lsblk' failed. diskType is empty                                  │
│ provision 2020-05-26 07:56:47.079958 D | exec: Running command: lsblk /dev/sr0 --bytes --nodeps --pairs --paths --output SIZE,ROTA,RO,TYPE,PKNAME,NAM │
│ provision 2020-05-26 07:56:47.082127 W | inventory: skipping device "sr0" because 'lsblk' failed. unsupported diskType rom   