#!/usr/bin/env bash

echo "Process started"

NAMESPACE=openshift-infra

cat <<EOF | oc apply -f -
apiVersion: v1
kind: ServiceAccount
metadata:
  name: wa-service-account
  namespace: $NAMESPACE
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: wa-role-binding
  namespace: $NAMESPACE
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
subjects:
- kind: ServiceAccount
  name: wa-service-account
  namespace: $NAMESPACE
EOF

TOKEN=$(kubectl get secrets -n ${NAMESPACE} $(oc get secrets -n ${NAMESPACE} | grep wa-service-account-token | awk '{print $1}' | head -1) -o jsonpath="{.data.token}"| base64 --decode )
echo "===================================================================================="
echo $TOKEN
echo "===================================================================================="

echo "Process completed .... "
