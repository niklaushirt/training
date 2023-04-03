


oc create -f common.yaml
oc create -f operator-openshift.yaml
oc create -f crd.yaml
oc create -f cluster-training.yaml

oc create -f route.yaml
oc create -f storageclass-test.yaml

kubectl -n rook-ceph get secret rook-ceph-dashboard-password -o jsonpath="{['data']['password']}" | base64 --decode && echo





oc delete -f storageclass-test.yaml

oc delete -f route.yaml

oc delete -f cluster-training.yaml



longhorn-service-account

