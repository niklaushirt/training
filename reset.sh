minikube stop
podman machine stop
podman machine rm -f

podman machine init --cpus 4 --memory 6666
podman machine start
minikube start --driver=podman
