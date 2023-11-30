

# Podman not responsive on Mac

https://github.com/containers/podman/issues/12751

```bash
podman system connection list
podman system connection default podman-machine-default-root
```


# Minikube not starting

You get the error:

🚜  Pulling base image ...
E1122 09:27:04.396359   35655 cache.go:189] Error downloading kic artifacts:  not yet implemented, see issue #8426

minkube delete
minikube start --driver=podman --container-runtime=containerd


