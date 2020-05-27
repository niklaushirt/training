sudo sfdisk /dev/sdb < ~/training/volumes/partition.sfdisk

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:gluster/glusterfs-7 -y
sudo apt install glusterfs-server -y
sudo systemctl start glusterd
sudo systemctl enable glusterd



apt-get install software-properties-common
add-apt-repository ppa:gluster/glusterfs-7
apt-get install glusterfs-server

mkfs.ext4 /dev/sdb1
mkdir -p /data/gluster
mount /dev/sdb1 /data/gluster
echo "/dev/sdb1 /data/gluster ext4 defaults 0 0" | tee --append /etc/fstab

ps -ef | grep glusterd 
systemctl status glusterd
gluster pool list


wget https://github.com/heketi/heketi/releases/download/v9.0.0/heketi-v9.0.0.linux.amd64.tar.gz 
tar -xzvf heketi-v9.0.0.linux.amd64.tar.gz
sudo chmod a+rw -R heketi/heketi
sudo chmod a+rw -R heketi/heketi-cli

sudo mv heketi/heketi /usr/share/bin
sudo mv heketi/heketi-cli /usr/share/bin



sudo groupadd --system heketi
sudo useradd -s /sbin/nologin --system -g heketi heketi


sudo mkdir -p /var/lib/heketi /etc/heketi /var/log/heketi

sudo ssh-keygen -f /etc/heketi/heketi_key -t rsa -N '' -m PEM
sudo chown heketi:heketi /etc/heketi/heketi_key*

/etc/systemd/system/heketi.service
[Unit]
Description=Heketi Server

[Service]
Type=simple
WorkingDirectory=/var/lib/heketi
EnvironmentFile=-/etc/heketi/heketi.env
User=heketi
ExecStart=/usr/local/bin/heketi --config=/etc/heketi/heketi.json
Restart=on-failure
StandardOutput=syslog
StandardError=syslog

[Install]
WantedBy=multi-user.target




sudo systemctl daemon-reload
sudo systemctl enable --now heketi
sudo chown -R heketi:heketi /var/lib/heketi /var/log/heketi /etc/heketi

curl http://localhost:8080/hello


sed -i "s/108.168.187.157/localhost/" ./yaml/topology.json
sed -i "s/\/dev\/xvdc/\/dev\/sdb1/" ./yaml/topology.json

more ./yaml/topology.json


heketi-cli topology load --json=./yaml/topology.json













wget https://github.com/heketi/heketi/releases/download/v9.0.0/heketi-v9.0.0.linux.amd64.tar.gz
tar -zxvf heketi-v9.0.0.linux.amd64.tar.gz



chmod +x heketi/{heketi,heketi-cli}
sudo cp heketi/{heketi,heketi-cli} /usr/local/bin


sudo groupadd --system heketi
sudo useradd -s /sbin/nologin --system -g heketi heketi


sudo mkdir -p /var/lib/heketi /etc/heketi /var/log/heketi

sudo ssh-keygen -f /etc/heketi/heketi_key -t rsa -N ''
sudo chown heketi:heketi /etc/heketi/heketi_key*



sudo systemctl daemon-reload
sudo systemctl enable --now heketi
sudo chown -R heketi:heketi /var/lib/heketi /var/log/heketi /etc/heketi


heketi-cli topology load --json=/etc/heketi/topology.json

heketi-cli cluster list













wget https://github.com/heketi/heketi/releases/download/v9.0.0/heketi-v9.0.0.linux.amd64.tar.gz 
tar -xzvf heketi-v9.0.0.linux.amd64.tar.gz
sudo chmod a+rw -R heketi/heketi
sudo chmod a+rw -R heketi/heketi-cli

sudo mv heketi/heketi /usr/local/bin
sudo mv heketi/heketi-cli /usr/local/bin


ssh-keygen -t rsa -C "your_email@example.com" -N mypassphrase -f .ssh/training




systemctl status glusterd
glusterfsd --version

# Create Disk

lsblk

fdisk /dev/sdb

sudo wipefs -a -f /dev/sdb1

systemctl stop firewalld
systemctl disable firewalld

sudo su -
yum install centos-release-gluster glusterfs-server thin-provisioning-tools -y 
yum install centos-release-gluster -y
yum install glusterfs-server -y
systemctl start glusterd

systemctl enable glusterd 

setsebool -P virt_sandbox_use_fusefs on


mkfs.ext4 /dev/sdb1
mkdir -p /data/gluster
mount /dev/sdb1 /data/gluster
echo "/dev/sdb1 /data/gluster ext4 defaults 0 0" | tee --append /etc/fstab

ps -ef | grep glusterd 
systemctl status glusterd
gluster pool list


cd /opt
wget https://github.com/heketi/heketi/releases/download/v9.0.0/heketi-v9.0.0.linux.amd64.tar.gz 
tar -xzvf heketi-v9.0.0.linux.amd64.tar.gz
sudo chmod a+rw -R heketi/heketi
sudo chmod a+rw -R heketi/heketi-cli

sudo mv heketi/heketi /usr/share/bin
sudo mv heketi/heketi-cli /usr/share/bin


cd /opt
wget https://github.com/niklaushirt/ICP4IonOCP/raw/master/yamfiles.zip
unzip yamfiles.zip

sudo su -
export PATH="/opt/heketi:$PATH"
heketi --config /opt/yaml/heketi.json 
ps -ef | grep heketi
curl http://localhost:8888/hello

sed -i "s/108.168.187.157/localhost/" /opt/yaml/topology.json
sed -i "s/\/dev\/xvdc/\/dev\/sdb1/" /opt/yaml/topology.json

more /opt/yaml/topology.json


# nano /opt/yaml/topology.json
export PATH="/opt/heketi:$PATH"
heketi --config /opt/yaml/heketi.json 

export HEKETI_CLI_SERVER=http://localhost:8888
heketi-cli topology load --json /opt/yaml/topology.json


Creating cluster ... ID: d8c25caa5cad686e337bd874af5d37c0

sed -i "s/108.168.187.157/192.168.27.190/" /opt/yaml/glustersc.yaml
sed -i "s/61f03e93646d435ced9185e7fa6c5d6f/d8c25caa5cad686e337bd874af5d37c0/" /opt/yaml/glustersc.yaml

more /opt/yaml/glustersc.yaml


# nano /opt/yaml/glustersc.yaml


oc delete -f /opt/yaml/glustersc.yaml
oc create -f /opt/yaml/glustersc.yaml
kubectl get sc

oc create ns icp
oc create -f /opt/yaml/my-pvc.yaml -n icp
oc get pvc -n icp
oc delete -f /opt/yaml/my-pvc.yaml -n icp















cd /opt/cloud-pak-master/spec/security/scc 
oc apply -f .
cd /opt/cloud-pak-master/spec/security/psp/ 
oc apply -f .


cd /opt/cloud-pak-master/spec/security/scc 
oc apply -f .
cd /opt/cloud-pak-master/spec/security/psp/ 
oc delete -f .







sudo rm /opt/heketi/heketi.db
sudo rm -r /var/lib/heketi/

yum remove centos-release-gluster glusterfs-server thin-provisioning-tools -y 
yum remove centos-release-gluster -y
yum remove glusterfs-server -y





{
  "clusters": [
    {
      "nodes": [
        {
          "node": {
            "hostnames": {
              "manage": [
                "108.168.187.157"
              ],
              "storage": [
                "108.168.187.157"
              ]
            },
            "zone": 1
          },
          "devices": [
              {
                  "name":"/dev/xvdc",
                  "destroydata": false
              }
          ]
	}
      ]
    }
  ]
}


