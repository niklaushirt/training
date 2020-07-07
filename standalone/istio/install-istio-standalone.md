# Istio installtion on IBM Cloud Kubernetes Cluster

You can find more detailed information here: [https://istio.io/latest/docs/setup/getting-started/](https://istio.io/latest/docs/setup/getting-started/)

## 1) Create Kubernetes Cluster on IBM Cloud 

1. Go to [https://cloud.ibm.com](https://cloud.ibm.com)

2. Login or create your account

3. Type `Kubernetes`in the search field and select `Kubernetes Service`

4. Select `Free Cluster` and click `Create`
 
5. Follow the instructions on the `Access` tab:
	1. Download and install a few CLI tools
	2. Log in to your IBM Cloud account.
	3. Set the Kubernetes context
	4. Verify that you can connect
	5. Run the following 
	
		```bash
		kubectl get nodes                                                                                                                           
		
		> NAME           STATUS   ROLES    AGE   VERSION
		> w.x.y.z.       Ready    <none>   24d   v1.17.6+IKS
		```
	6. Now you're ready to follow the next steps

## 2) Get Istio

### For MAC

```bash
wget https://github.com/istio/istio/releases/download/1.6.4/istio-1.6.4-osx.tar.gz
tar xfvz istio-1.6.4-osx.tar.gz
```

### For Linux

```bash
wget https://github.com/istio/istio/releases/download/1.6.4/istio-1.6.4-linux-amd64.tar.gz
tar xfvz istio-1.6.4-linux-amd64.tar.gz 
```

### For Windows 
Download and install: 

[https://github.com/istio/istio/releases/download/1.6.4/istio-1.6.4-win.zip](https://github.com/istio/istio/releases/download/1.6.4/istio-1.6.4-win.zip)


## 3) Install Istio



2. Add the `istioctl` client to your executables. 

    ```bash
	export PATH=./istio-1.6.4/bin:$PATH

    ```

3. Install Istio into the cluster:

    ```bash
   istioctl install --set profile=demo
       
    > Detected that your cluster does not support third party JWT authentication. Falling back to less secure first party JWT. See https://istio.io/docs/ops/best-practices/security/#configure-third-party-service-account-tokens for details.
	> ✔ Istio core installed                                                                                                                                            
	> - Processing resources for Istiod. Waiting for Deployment/istio-system/istiod 
   > ...
    ```


4. Label the default namespace for automatic sidecar injection

	```bash
	kubectl label namespace default istio-injection=enabled                                                                                   
	
	> namespace/default labeled
	```
	
5. Check the labels 
	
	```bash
	kubectl get ns --show-labels                                                                                                              
	
	> NAME                   STATUS   AGE   LABELS
	> default                Active   66d   istio-injection=enabled
	> istio-system           Active   62s   istio-injection=disabled,istio-operator-managed=Reconcile,operator.istio.io/	> component=Base,operator.istio.io/managed=Reconcile,operator.istio.io/version=1.4.0
	> kube-node-lease        Active   66d   <none>
	> kube-public            Active   66d   <none>
	> kube-system            Active   66d   <none>
	> kubernetes-dashboard   Active   66d   addonmanager.kubernetes.io/mode=Reconcile,kubernetes.io/minikube-addons=dashboard
	```


6. Ensure the corresponding pods are all in **`Running`** state before you continue.

    ```bash
    kubectl get pods -n istio-system
    
	> NAME                                    READY   STATUS    RESTARTS   AGE
	> grafana-5dc4b4676c-dsdb5                1/1     Running   0          21m
	> istio-egressgateway-5c7967cf9d-gnrpj    1/1     Running   0          21m
	> istio-ingressgateway-676fbf789d-vldbf   1/1     Running   0          21m
	> istio-tracing-8584b4d7f9-cj9p6          1/1     Running   0          21m
	> istiod-55cd8455dd-4gq2j                 1/1     Running   0          23m
	> kiali-6f457f5964-pvjw5                  1/1     Running   0          21m
	> prometheus-7f54ff69cd-lf4xz             2/2     Running   0          21m
    ```


	
Before you continue, make sure all the pods are deployed and are either in the **`Running`** or **`Completed`** state. If they're in `Pending` or `CrashLoopBackOff` state, wait a few minutes to let the deployment to settle.

Congratulations! You successfully installed Istio into your cluster.



## 4) Continue with the Labs

For the rest of the Lab you can follow up starting with `Lab 3 - Deploy sample BookInfo application with Istio sidecar injected`