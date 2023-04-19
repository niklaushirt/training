
You must have the following setup on your PC:

*   Podman
*   Minikube
*   Git

This requires a minimum of:

- 2 physical CPU cores
- 6 GB of free memory


For the MeshNetwork (Istio) Lab you need a minimum of:

- 4 physical CPU cores
- 9 GB of free memory




<InlineNotification kind="info">
If Minikube is not an option you can use OpenShift Local or any other Kubernetes solution (but this is untested and you're on your own).
</InlineNotification>


## 🚀 TASK: Install prerequisites on Mac

1. Install CLI Tools

    <a href="https://kubernetes.io/docs/tasks/tools/" target="_blank" >🌏 Detailed Documentation for the Task</a>

    ```bash
    brew install kubernetes-cli
    ```

2. Install Podman

    <a href="https://podman.io/getting-started/installation" target="_blank" >🌏 Detailed Documentation for the Task</a>

    ```bash
    brew install podman
    ```

3. Start Podman

    ```bash
    podman machine init --cpus 4 --memory 6666
    podman machine start
    ```


4. Install Minikube

    <a href="https://kubernetes.io/fr/docs/tasks/tools/install-minikube/" target="_blank" >🌏 Detailed Documentation for the Task</a>

    1. Install Minikube

        ```bash
        brew install minikube
        ```

    2. Start Minikube 

        ```bash
        minikube start --driver=podman
        ```










## 🚀 TASK: Install prerequisites on Windows

1. Install CLI Tools

    <a href="https://kubernetes.io/docs/tasks/tools/" target="_blank" >🌏 Detailed Documentation for the Task</a>

    ```bash
    curl.exe -LO "https://dl.k8s.io/release/v1.26.0/bin/windows/amd64/kubectl.exe"
    ```

2. Install Podman

    <a href="https://github.com/containers/podman/blob/main/docs/tutorials/podman-for-windows.md" target="_blank" >🌏 Follow the official Documentation</a>



3. Start Podman

    ```bash
    podman machine init --cpus 4 --memory 6666
    podman machine start
    ```


4. Install Minikube

    <a href="https://kubernetes.io/fr/docs/tasks/tools/install-minikube/" target="_blank" >🌏 Detailed Documentation for the Task</a>

    1. Download Minikube

        <a href="https://github.com/kubernetes/minikube/releases/tag/v1.30.1" target="_blank" >Download from here</a>

    1. Start Minikube 

        ```bash
        minikube start --driver=podman --insecure-registry "10.0.0.0/24"
        ```


5. Install some addons we will need later

    ```bash
    minikube addons enable registry    
    minikube addons enable ingress    
    minikube addons enable dashboard    
    minikube addons list|grep enabled
    ```

    ```output
    | dashboard                   | minikube | enabled ✅   | Kubernetes                     |
    | default-storageclass        | minikube | enabled ✅   | Kubernetes                     |
    | ingress                     | minikube | enabled ✅   | Kubernetes                     |
    | registry                    | minikube | enabled ✅   | Google                         |
    | storage-provisioner         | minikube | enabled ✅   | Google                         |
    ```