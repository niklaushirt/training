podman machine list
podman machine init
podman machine start


git clone https://github.com/niklaushirt/training.git

cd ~/training/demo-app/tomcat
podman build -t myimage:1.0.0 .
podman images 



podman run --rm -d --name myimage -p 8080:8080 myimage:1.0.0
podman ps 
open http://localhost:8080/yourwarfile/

podman kill <CONTAINER_ID>



podman login docker.io
podman tag myimage:1.0.0 niklaushirt/myimage:1.0.0
podman images 
podman push niklaushirt/myimage:1.0.0




