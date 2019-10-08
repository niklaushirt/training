package mydemofrontend

import (
	"context"

	demov1beta1 "demo-operator-frontend/pkg/apis/demo/v1beta1"

	appsv1 "k8s.io/api/apps/v1"
	intstr "k8s.io/apimachinery/pkg/util/intstr"


	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/api/errors"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/types"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/controller"
	"sigs.k8s.io/controller-runtime/pkg/controller/controllerutil"
	"sigs.k8s.io/controller-runtime/pkg/handler"
	"sigs.k8s.io/controller-runtime/pkg/manager"
	"sigs.k8s.io/controller-runtime/pkg/reconcile"
	logf "sigs.k8s.io/controller-runtime/pkg/runtime/log"
	"sigs.k8s.io/controller-runtime/pkg/source"
)

var log = logf.Log.WithName("controller_mydemofrontend")

/**
* USER ACTION REQUIRED: This is a scaffold file intended for the user to modify with their own Controller
* business logic.  Delete these comments after modifying this file.*
 */

// Add creates a new MyDemoFrontend Controller and adds it to the Manager. The Manager will set fields on the Controller
// and Start it when the Manager is Started.
func Add(mgr manager.Manager) error {
	return add(mgr, newReconciler(mgr))
}






//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
// Create Reconciler and add watches
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------

// newReconciler returns a new reconcile.Reconciler
func newReconciler(mgr manager.Manager) reconcile.Reconciler {
	return &ReconcileMyDemoFrontend{client: mgr.GetClient(), scheme: mgr.GetScheme()}
}

// add adds a new Controller to mgr with r as the reconcile.Reconciler
func add(mgr manager.Manager, r reconcile.Reconciler) error {
	// Create a new controller
	c, err := controller.New("mydemofrontend-controller", mgr, controller.Options{Reconciler: r})
	if err != nil {
		return err
	}

	// Watch for changes to primary resource MyDemoFrontend
	err = c.Watch(&source.Kind{Type: &demov1beta1.MyDemoFrontend{}}, &handler.EnqueueRequestForObject{})
	if err != nil {
		return err
	}

	// Watch for changes to secondary resource Deployment
	err = c.Watch(&source.Kind{Type: &appsv1.Deployment{}}, &handler.EnqueueRequestForOwner{
		IsController: true,
		OwnerType:    &demov1beta1.MyDemoFrontend{},
	})
	if err != nil {
		return err
	}

	// Watch for changes to secondary resource Service
	err = c.Watch(&source.Kind{Type: &corev1.Service{}}, &handler.EnqueueRequestForOwner{
		IsController: true,
		OwnerType:    &demov1beta1.MyDemoFrontend{},
	})
	if err != nil {
		return err
	}

	return nil
}



// blank assignment to verify that ReconcileMyDemoFrontend implements reconcile.Reconciler
var _ reconcile.Reconciler = &ReconcileMyDemoFrontend{}

// ReconcileMyDemoFrontend reconciles a MyDemoFrontend object
type ReconcileMyDemoFrontend struct {
	// This client, initialized using mgr.Client() above, is a split client
	// that reads objects from the cache and writes to the apiserver
	client client.Client
	scheme *runtime.Scheme
}






//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
// Reconcile Loop
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
// Reconcile reads that state of the cluster for a MyDemoFrontend object and makes changes based on the state read
// and what is in the MyDemoFrontend.Spec
// TODO(user): Modify this Reconcile function to implement your Controller logic.  This example creates
// a Pod as an example
// Note:
// The Controller will requeue the Request to be processed again if the returned error is non-nil or
// Result.Requeue is true, otherwise upon completion it will remove the work from the queue.
func (r *ReconcileMyDemoFrontend) Reconcile(request reconcile.Request) (reconcile.Result, error) {
	reqLogger := log.WithValues("Request.Namespace", request.Namespace, "Request.Name", request.Name)
	reqLogger.Info("Reconciling MyDemoFrontend")
	
	
	//--------------------------------------------------------------------------------------------
	// Fetch the MyDemoFrontend instance
	//--------------------------------------------------------------------------------------------
	instance := &demov1beta1.MyDemoFrontend{}
	err := r.client.Get(context.TODO(), request.NamespacedName, instance)
	if err != nil {
		if errors.IsNotFound(err) {
			// Request object not found, could have been deleted after reconcile request.
			// Owned objects are automatically garbage collected. For additional cleanup logic use finalizers.
			// Return and don't requeue
			return reconcile.Result{}, nil
		}
		// Error reading the object - requeue the request.
		return reconcile.Result{}, err
	}

	//--------------------------------------------------------------------------------------------
	// Define the Deployment object
	//--------------------------------------------------------------------------------------------
	deployment := newMyDemoDeployment(instance)

	// Set MyDemoFrontend instance as the owner and controller
	if err := controllerutil.SetControllerReference(instance, deployment, r.scheme); err != nil {
		return reconcile.Result{}, err
	}

	//--------------------------------------------------------------------------------------------
	// Define the Service object
	//--------------------------------------------------------------------------------------------
	service := newMyDemoService(instance)

	// Set MyDemoFrontend instance as the owner and controller
	if err := controllerutil.SetControllerReference(instance, service, r.scheme); err != nil {
		return reconcile.Result{}, err
	}



	//--------------------------------------------------------------------------------------------
	// CRUD the Deployment object
	//--------------------------------------------------------------------------------------------
	// Check if this Deployment already exists
	foundDeployment := &appsv1.Deployment{}
	err = r.client.Get(context.TODO(), types.NamespacedName{Name: deployment.Name, Namespace: deployment.Namespace}, foundDeployment)
	if err != nil && errors.IsNotFound(err) {
		reqLogger.Info("Creating a new Deployment", "Deployment.Namespace", deployment.Namespace, "Deployment.Name", deployment.Name)
		err = r.client.Create(context.TODO(), deployment)
		if err != nil {
			return reconcile.Result{}, err
		}

		// Deployment created successfully - don't requeue
		return reconcile.Result{}, nil
	} else if err != nil {
		return reconcile.Result{}, err
	}

	// Check if the Image in CR has changed and update accordingly
	image:=instance.Spec.Image
	if  foundDeployment.Spec.Template.Spec.Containers[0].Image != image {
		foundDeployment.Spec.Template.Spec.Containers[0].Image = image
		err = r.client.Update(context.TODO(), foundDeployment)
		if err != nil {
			reqLogger.Error(err, "Failed to update Deployment for Image.", "Deployment.Namespace", foundDeployment.Namespace, "Deployment.Name", foundDeployment.Name)
			return reconcile.Result{}, err
		}
		reqLogger.Info("Updating Deployment for Image.", "Deployment.Namespace", foundDeployment.Namespace, "Deployment.Name", foundDeployment.Name)

	}

	// Check if the Backend in CR has changed and update accordingly
	backendURL:=instance.Spec.Backend
	if foundDeployment.Spec.Template.Spec.Containers[0].Env[0].Value != backendURL {
		foundDeployment.Spec.Template.Spec.Containers[0].Env[0].Value = backendURL
		err = r.client.Update(context.TODO(), foundDeployment)
		if err != nil {
			reqLogger.Error(err, "Failed to update Deployment for Backend URL.", "Deployment.Namespace", foundDeployment.Namespace, "Deployment.Name", foundDeployment.Name)
			return reconcile.Result{}, err
		}
		reqLogger.Info("Updating Deployment for Backend URL.", "Deployment.Namespace", foundDeployment.Namespace, "Deployment.Name", foundDeployment.Name)

	}




	//--------------------------------------------------------------------------------------------
	// Fetch the Service object
	//--------------------------------------------------------------------------------------------

	// Check if this Service already exists
	foundService := &corev1.Service{}
	err = r.client.Get(context.TODO(), types.NamespacedName{Name: service.Name, Namespace: service.Namespace}, foundService)
	if err != nil && errors.IsNotFound(err) {
		reqLogger.Info("Creating a new Service", "Service.Namespace", service.Namespace, "Service.Name", service.Name)
		err = r.client.Create(context.TODO(), service)
		if err != nil {
			return reconcile.Result{}, err
		}

		// Service created successfully - don't requeue
		return reconcile.Result{}, nil
	} else if err != nil {
		return reconcile.Result{}, err
	}


	// CR already exists - don't requeue
	//reqLogger.Info("Skip reconcile: Deployment already exists", "Deployment.Namespace", foundDeployment.Namespace, "Deployment.Name", foundDeployment.Name)
	return reconcile.Result{}, nil
}



//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
// Deployment object
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
func newMyDemoDeployment(cr *demov1beta1.MyDemoFrontend) *appsv1.Deployment {
	return &appsv1.Deployment{
	  TypeMeta: metav1.TypeMeta{
		Kind:       "Deployment",
		APIVersion: "apps/v1",
	  },
	  ObjectMeta: metav1.ObjectMeta{
		Name:      cr.Name + "-deployment",
		Namespace: cr.Namespace,
	  },
	  Spec: appsv1.DeploymentSpec{
		Selector: &metav1.LabelSelector{
		  MatchLabels: map[string]string{"deployment": cr.Name + "-deployment"},
		},
		Template: corev1.PodTemplateSpec{
		  ObjectMeta: metav1.ObjectMeta{
			Labels: map[string]string{"deployment": cr.Name + "-deployment"},
		  },
		  Spec: corev1.PodSpec{
			Containers: []corev1.Container{
			  {
				Name:  "my-demo-pod",
				Image: cr.Spec.Image,
				Env: []corev1.EnvVar{
					{
					  Name:  "BACKEND_URL",
					  Value: cr.Spec.Backend,
						},
				  },
			  },
			},
		  },
		},
	  },
	}
}
  


//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
// Service object
//--------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------
func newMyDemoService(cr *demov1beta1.MyDemoFrontend) *corev1.Service {
	return &corev1.Service{
	  TypeMeta: metav1.TypeMeta{
		Kind:       "Service",
		APIVersion: "v1",
	  },
	  ObjectMeta: metav1.ObjectMeta{
		Name:      cr.Name + "-service",
		Namespace: cr.Namespace,
	  },
	  Spec: corev1.ServiceSpec{
		Type:  "NodePort",
		Selector: map[string]string{"deployment": cr.Name + "-deployment"},
		Ports: []corev1.ServicePort{
			{
				Name: "http", 
				Port: 3000, 
				TargetPort: intstr.FromInt(3000),
			},
		},
	  },
	}
  }
  