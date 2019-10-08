package controller

import (
	"demo-operator-backend/pkg/controller/mydemobackend"
)

func init() {
	// AddToManagerFuncs is a list of functions to create controllers and add them to a manager.
	AddToManagerFuncs = append(AddToManagerFuncs, mydemobackend.Add)
}
