#!/bin/bash

echo "process started ..... $(date)"

source ./00-util.sh

NAMESPACE=cp4waiops

oc project $NAMESPACE

export USER="$(oc get secret aiops-ir-core-ncodl-api-secret -o jsonpath='{.data.username}' | base64 --decode)"
export PASS="$(oc get secret aiops-ir-core-ncodl-api-secret -o jsonpath='{.data.password}' | base64 --decode)"
export USER_PASS=$USER:$PASS

cat <<EOF | oc apply -f -
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: datalayer-api
  namespace: $NAMESPACE
spec:
  port:
    targetPort: secure-port
  tls:
    insecureEdgeTerminationPolicy: Redirect
    termination: reencrypt
  to:
    kind: Service
    name: aiops-ir-core-ncodl-api
    weight: 100
  wildcardPolicy: None
EOF

sleep 5

export URL_DATALAYER=$(oc get route  -n $NAMESPACE datalayer-api  -o jsonpath='{.status.ingress[0].host}')
export URL_STORIES=https://$URL_DATALAYER/irdatalayer.aiops.io/active/v1/stories
export URL_ALERTS=https://$URL_DATALAYER/irdatalayer.aiops.io/active/v1/alerts

echo "================================================================"
echo "USER_PASS : $USER_PASS"
echo "URL_STORIES : $URL_STORIES"
echo "URL_ALERTS : $URL_ALERTS"
echo "================================================================"

### Export Stories
generateOutputFileName "stories.json"
echo "The stories would be available in the file : $GLOBAL_OUTPUT_FILE_NAME"
curl "${URL_STORIES}" -X GET -u "${USER_PASS}" -H "x-username:admin" -H "x-subscription-id:cfd95b7e-3bc7-4006-a4a8-a73a79c71255" > $GLOBAL_OUTPUT_FILE_NAME

### Export Alerts
generateOutputFileName "alerts.json"
echo "The alerts would be available in the file : $GLOBAL_OUTPUT_FILE_NAME"
curl "${URL_ALERTS}" -X GET -u "${USER_PASS}" -H "x-username:admin" -H "x-subscription-id:cfd95b7e-3bc7-4006-a4a8-a73a79c71255" > $GLOBAL_OUTPUT_FILE_NAME

echo "process completed ..... $(date)"
