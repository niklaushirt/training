# Standalone installation

## 1) Install the prerequisites

This describes how to setup an environment on your local PC. 
This is **untested** and I cannot guarantee that all the Labs will be working 100%.

You must have the following setup on your PC:

* Minikube
* Docker 
* Git


1. Clone the lab repository to your home directory

	`git clone https://github.com/niklaushirt/training.git`


2. Go to the installation directory

	`cd ~/training/standalone`

3. Run the preparation script

	`./standalone-pc.sh`
	
	
	
4. Get the Cluster IP (MY-CLUSTER-IP)
	
	```bash
	minikube ip
	```

	
5. You can access the PTE via

	```bash
	http://<MY-CLUSTER-IP>:31222
	```
