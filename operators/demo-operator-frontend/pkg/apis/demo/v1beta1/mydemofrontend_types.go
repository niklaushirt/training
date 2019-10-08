package v1beta1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// EDIT THIS FILE!  THIS IS SCAFFOLDING FOR YOU TO OWN!
// NOTE: json tags are required.  Any new fields you add must have json tags for the fields to be serialized.

// MyDemoFrontendSpec defines the desired state of MyDemoFrontend
// +k8s:openapi-gen=true
type MyDemoFrontendSpec struct {
	// INSERT ADDITIONAL SPEC FIELDS - desired state of cluster
	// Important: Run "operator-sdk generate k8s" to regenerate code after modifying this file
	// Add custom validation using kubebuilder tags: https://book-v1.book.kubebuilder.io/beyond_basics/generating_crd.html
		   
	// Label is the value of the 'daemon=' label to set on a node that should run the daemon
	Label string `json:"label"`
	// Image is the Docker image to run for the daemon
	Image string `json:"image"`
	// Image is the Docker backend image to run for the daemon
	Backend string `json:"backend"`
}

// MyDemoFrontendStatus defines the observed state of MyDemoFrontend
// +k8s:openapi-gen=true
type MyDemoFrontendStatus struct {
	// INSERT ADDITIONAL STATUS FIELD - define observed state of cluster
	// Important: Run "operator-sdk generate k8s" to regenerate code after modifying this file
	// Add custom validation using kubebuilder tags: https://book-v1.book.kubebuilder.io/beyond_basics/generating_crd.html
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// MyDemoFrontend is the Schema for the mydemofrontends API
// +k8s:openapi-gen=true
// +kubebuilder:subresource:status
type MyDemoFrontend struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	Spec   MyDemoFrontendSpec   `json:"spec,omitempty"`
	Status MyDemoFrontendStatus `json:"status,omitempty"`
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// MyDemoFrontendList contains a list of MyDemoFrontend
type MyDemoFrontendList struct {
	metav1.TypeMeta `json:",inline"`
	metav1.ListMeta `json:"metadata,omitempty"`
	Items           []MyDemoFrontend `json:"items"`
}

func init() {
	SchemeBuilder.Register(&MyDemoFrontend{}, &MyDemoFrontendList{})
}
