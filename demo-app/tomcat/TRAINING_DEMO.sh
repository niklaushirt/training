podman machine list
podman machine init
podman machine start
crc start

podman run -d -p 8000:8000 -p 9001:9000 --rm --name=portainer -v portainer_data:/data --privileged -v /run/podman/podman.sock:/var/run/docker.sock:Z portainer/portainer-ce:2.17.0-alpine 



git clone https://github.com/niklaushirt/training.git





cd ~/training/demo-app/tomcat
podman build -t myimage:1.0.0 .

podman buildx build --platform linux/amd64 -t niklaushirt/cp4waips-pagerduty-story-pusher:x86 --load .


podman images 


podman run --rm -ti myimage:1.0.0 /bin/bash

cat /etc/os-release
uname -r
apt-get install git


podman run --rm -d --name myimage -p 8080:8080 myimage:1.0.0
podman ps 
open http://localhost:8080/yourwarfile/

podman kill <CONTAINER_ID>



podman login docker.io
podman tag myimage:1.0.0 niklaushirt/myimage:1.0.0
podman images 
podman push niklaushirt/myimage:1.0.0

open https://hub.docker.com/repositories/niklaushirt




podman manifest rm echo-pod

podman manifest inspect echo-pod
podman manifest push echo-pod niklaushirt/echo-pod:0.3


