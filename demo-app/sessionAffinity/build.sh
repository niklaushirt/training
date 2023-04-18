
podman manifest rm echo-pod
podman build --platform linux/arm64/v8 --platform linux/amd64 -t niklaushirt/echo-pod:0.3  --manifest echo-pod .
podman manifest inspect echo-pod
podman manifest push echo-pod niklaushirt/echo-pod:0.3 






podman build -t niklaushirt/echo-pod:0.1 .
podman push niklaushirt/echo-pod:0.1

podman buildx build --platform linux/arm64/v8,linux/amd64 -t niklaushirt/echo-pod:0.2 --load .





 linux/arm64/v8,linux/amd64 


 docker buildx build --platform linux/arm64/v8,linux/amd64 -t niklaushirt/echo-pod:0.2 --load .
