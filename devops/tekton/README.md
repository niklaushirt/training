# Tekton Demo

## Install

### Create Namespaces
```bash
kubectl create ns demo-oiz-prod
kubectl create ns demo-oiz-test
kubectl create ns demo-oiz-dev
```

### Create Dashboard
```bash
kubectl apply -n openshift-pipelines -f ./misc/tekton-dashboard-release.yaml
```


### Adapt RBAC (ugly hack)
```bash
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:oiz-demo-pipeline:oiz-demo-service-account
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-prod:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-dev-nikh:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-nikh:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-test:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:demo-oiz-dev:default
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:openshift-pipelines:tekton-dashboard
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:tekton-pipelines:default
```


### Create Pull Secret
```bash
kubectl create -n oiz-demo-pipeline secret docker-registry regcred \
                    --docker-server=quay.io \
                    --docker-username=<MY_USERNAME> \
                    --docker-password=<MY_PASSWORD> \
                    --docker-email=<MY_EMAIL>
```

### Create Cluster Secrets

```bash
kubectl create -n oiz-demo-pipeline secret generic local-cluster-secrets \
                    --from-literal=url=https://c100-e.eu-de.containers.cloud.ibm.com:30761 \
                    --from-literal=cadatakey=1yYDIbgCV-1B4VUh9M1XPFfjWn7dJnNIGzDPK5eyrlc \
                    --from-literal=tokenkey=1yYDIbgCV-1B4VUh9M1XPFfjWn7dJnNIGzDPK5eyrlc
```

```bash
kubectl create -n oiz-demo-pipeline secret generic prod-cluster-secrets \
                    --from-literal=url=https://c100-e.eu-de.containers.cloud.ibm.com:32764 \
                    --from-literal=cadatakey=CtWGTAQX4nrIDdGvWVVywtTw_35zm-c3GdkurtE-V_s \
                    --from-literal=tokenkey=CtWGTAQX4nrIDdGvWVVywtTw_35zm-c3GdkurtE-V_s
```
## Create Base Demo Stuff

Manifests in folder `deploy`

```bash
kubectl apply -n demo-oiz-prod -f ./deploy/prod/
kubectl apply -n demo-oiz-prod -f ./deploy/db

kubectl apply -n demo-oiz-test -f ./deploy/test/
kubectl apply -n demo-oiz-test -f ./deploy/db

kubectl apply -n demo-oiz-dev -f ./deploy/dev/
kubectl apply -n demo-oiz-dev -f ./deploy/db/

kubectl apply -n demo-oiz-nikh -f ./deploy/dev/
kubectl apply -n demo-oiz-nikh -f ./deploy/db/
```

## Create Pipeline





Manifests in folder `tekton`

```bash
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-init.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-resources-git.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-resources-cluster.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-tasks.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-complete.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-local.yaml
```


### Create Pipeline Runs

Manifests in folder `tekton`

```bash
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-run-local.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-pipeline-run-complete.yaml
```


## Create Triggers

Create two GitHub WebHooks to the triggers.
dev: push
prod: pull_request

```bash
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-trigger.yaml
kubectl apply -n oiz-demo-pipeline -f ./tekton/tekton-trigger-global.yaml
```

### Simulate GitHub events

#### Push event

```bash
curl -v \
-H 'X-GitHub-Event: push' \
-H 'X-Hub-Signature: sha1=04b10a4629d3f62606fdd8d4824cbe546eb43e1d' \
-H 'Content-Type: application/json' \
-d '{"head_commit":{"id":"4e054cddfa7c3d81b2ca562e5298b823c404b0c5"},"repository":{"url": "https://github.com/tektoncd/triggers"}}' \
http://github-oiz-demo-pipeline.oizdemo1-a376efc1170b9b8ace6422196c51e491-0000.eu-de.containers.appdomain.cloud/
```

#### Pull Request event

```bash
curl -v \
-H 'X-GitHub-Event: pull_request' \
-H 'X-Hub-Signature: sha1=4cb5c8288af057acaf1ae5f078c58bf074ae236c' \
-H 'Content-Type: application/json' \
-d '{"pull_request":{"id":"427329658"},"repository":{"url": "https://github.com/tektoncd/triggers"}}' \
http://github-prod-oiz-demo-pipeline.oizdemo1-a376efc1170b9b8ace6422196c51e491-0000.eu-de.containers.appdomain.cloud/
```

If you want to alter the payload you have to change the X-Hub-Signature with a Secret Key of `1234567`.

This can be done here: 
[HMAC Generator](https://www.freeformatter.com/hmac-generator.html)




## Delete Pipeline Resources
```bash
kubectl delete -n oiz-demo-pipeline taskrun --all
kubectl delete -n oiz-demo-pipeline pipelinerun --all
kubectl delete -n oiz-demo-pipeline pipeline --all
kubectl delete -n oiz-demo-pipeline tasks --all
kubectl delete -n oiz-demo-pipeline pipelineresource --all




kubectl delete deployment wordpress -n demo-oiz-dev
kubectl delete deployment wordpress-mysql -n demo-oiz-dev
kubectl delete service wordpress -n demo-oiz-dev
kubectl delete route wordpress-dev -n demo-oiz-dev

kubectl delete deployment wordpress -n demo-oiz-test
kubectl delete deployment wordpress-mysql -n demo-oiz-test
kubectl delete service wordpress -n demo-oiz-test
kubectl delete route wordpress-dev -n demo-oiz-test

kubectl delete deployment wordpress -n demo-oiz-prod
kubectl delete deployment wordpress-mysql -n demo-oiz-prod
kubectl delete service wordpress -n demo-oiz-prod
kubectl delete route wordpress-dev -n demo-oiz-prod
```


kubectl delete deployment wordpress -n demo-oiz-dev-nikh 
kubectl delete deployment wordpress-mysql -n demo-oiz-dev-nikh 
kubectl delete service wordpress -n demo-oiz-dev-nikh 
kubectl delete route wordpress-dev -n demo-oiz-dev-nikh 


