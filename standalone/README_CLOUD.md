
# Cloud installation



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
	

## 2) Install the prerequisites

This describes how to setup an environment in the Cloud. 
This is **untested** and I cannot guarantee that all the Labs will be working 100%.

You must have the following setup on your PC:

* Docker 
* Git


1. Clone the lab repository to your home directory

	`git clone https://github.com/niklaushirt/training.git`


2. Go to the installation directory

	`cd ~/training/standalone`

3. Run the preparation script

	`./standalone-cloud.sh`
	
	
	
	
