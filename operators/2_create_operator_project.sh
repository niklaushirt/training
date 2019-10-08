# https://github.com/operator-framework/operator-sdk/blob/master/doc/user-guide.md
# https://itnext.io/building-an-operator-for-kubernetes-with-operator-sdk-40a029ea056
# https://github.com/kubernetes/sample-controller/blob/master/controller_test.go

# https://godoc.org/k8s.io/api/core/v1#Service
# https://godoc.org/k8s.io/api/apps/v1#Deployment



export GOPATH=$HOME/go
export GO111MODULE=on


mkdir -p $GOPATH/src
cd $GOPATH/src

#Create Project
operator-sdk new lab-operator 
cd lab-operator


# -------------------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------------------
# CREATE API
# -------------------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------------------

operator-sdk add api --api-version=demo.ibm.com/v1beta1 --kind=MyDemoFrontend


# Edit API Parameters 
nano ./pkg/apis/demo/v1beta1/MyDemoFrontend_types.go


type MyDemoFrontendSpec struct {
        // INSERT ADDITIONAL SPEC FIELDS - desired state of cluster
        // Important: Run "operator-sdk generate k8s" to regenerate code after modifying this file
        // Add custom validation using kubebuilder tags: https://book-v1.book.kubebuilder.io/beyond_basics/generating_crd.html

        // Image is the Docker image to run for the daemon
        Image string `json:"image"`
}




# Generate API
operator-sdk generate k8s
operator-sdk generate openapi


# Modify the Custom resource to include the image information 

nano ./deploy/crds/lab_v1beta1_MyDemoFrontend_cr.yaml
busybox

apiVersion: lab.ibm.com/v1beta1
kind: MyDemoFrontend
metadata:
  name: example-MyDemoFrontend
spec:
  # Add fields here
  size: 3
  image: busybox





# -------------------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------------------
# CREATE CONTROLLER
# -------------------------------------------------------------------------------------------------------------
# -------------------------------------------------------------------------------------------------------------

operator-sdk add controller --api-version=lab.ibm.com/v1beta1 --kind=MyDemoFrontend



nano ./pkg/controller/MyDemoFrontend/MyDemoFrontend_controller.go



// newPodForCR returns a busybox pod with the same name/namespace as the cr
func newPodForCR(cr *labv1beta1.MyDemoFrontend) *corev1.Pod {
        labels := map[string]string{
                "app": cr.Name,
        }
        return &corev1.Pod{
                ObjectMeta: metav1.ObjectMeta{
                        Name:      cr.Name + "-pod",
                        Namespace: cr.Namespace,
                        Labels:    labels,
                },
                Spec: corev1.PodSpec{
                        Containers: []corev1.Container{
                                {
                                        Name:    "busybox",
                                        Image:   cr.Spec.Image,
                                        Command: []string{"sleep", "3600"},
                                },
                        },
                },
        }
}



operator-sdk build niklaushirt/lab-operator:v0.0.1
sed -i "" 's|REPLACE_IMAGE|<DOCKER_HUB_REPO>/demo-operator:v0.0.1|g' deploy/operator.yaml
docker push niklaushirt/lab-operator:v0.0.1


operator-sdk build <DOCKER_HUB_REPO>/lab-operator:v0.0.1
sed -i "" 's|REPLACE_IMAGE|<DOCKER_HUB_REPO>/demo-operator:v0.0.1|g' deploy/operator.yaml
docker push <DOCKER_HUB_REPO>/lab-operator:v0.0.1



operator-sdk build niklaushirt/demo-operator:v0.0.1

INFO[0006] Building OCI image niklaushirt/demo-operator:v0.0.1
Sending build context to Docker daemon  42.22MB
Step 1/7 : FROM registry.access.redhat.com/ubi7/ubi-minimal:latest
 ---> 23629269a21d
Step 2/7 : ENV OPERATOR=/usr/local/bin/lab-operator     USER_UID=1001     USER_NAME=lab-operator
 ---> Running in 888a626caa00
Removing intermediate container 888a626caa00
 ---> a8682e57463c
Step 3/7 : COPY build/_output/bin/lab-operator ${OPERATOR}
 ---> dda4a70a7ab5
 ....



sed -i "" 's|REPLACE_IMAGE|niklaushirt/demo-operator:v0.0.1|g' deploy/operator.yaml

docker push niklaushirt/demo-operator:v0.0.1

INFO[0011] Operator build complete.
The push refers to repository [docker.io/niklaushirt/demo-operator]
065e04c7f32f: Pushed
0a540f347571: Pushed
88c444664ef4: Pushed
9b383c598a2b: Layer already exists
4152b9bffa26: Layer already exists


kubectl create -f ./deploy/crds/lab_v1beta1_MyDemoFrontend_crd.yaml

customresourcedefinition.apiextensions.k8s.io/MyDemoFrontends.lab.ibm.com created

kubectl create -f ./deploy/service_account.yaml
kubectl create -f ./deploy/role.yaml
kubectl create -f ./deploy/role_binding.yaml

serviceaccount/lab-operator created
role.rbac.authorization.k8s.io/lab-operator created
rolebinding.rbac.authorization.k8s.io/lab-operator created

kubectl create -f ./deploy/operator.yaml

deployment.apps/lab-operator created

kubectl create -f ./deploy/crds/lab_v1beta1_MyDemoFrontend_cr.yaml

MyDemoFrontend.lab.ibm.com/example-MyDemoFrontend created


kubectl get pods | grep lab

example-MyDemoFrontend-pod                               1/1       Running   0          56s
lab-operator-6c45d4bb79-d4wgb                       1/1       Running   0          1m


kubectl delete -f ./deploy/crds/lab_v1beta1_MyDemoFrontend_crd.yaml
kubectl delete -f ./deploy/service_account.yaml
kubectl delete -f ./deploy/role.yaml
kubectl delete -f ./deploy/role_binding.yaml
kubectl delete -f ./deploy/operator.yaml
kubectl delete -f ./deploy/crds/lab_v1beta1_MyDemoFrontend_cr.yaml
