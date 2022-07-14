#!/bin/bash

echo "process started ..... $(date)"

NAMESPACE=cp4waiops

oc create route passthrough flink-job-manager -n $NAMESPACE --service=cp4waiops-eventprocessor-eve-29ee-ep-jobmanager  --port=8081

export username=$(oc get secret -n $NAMESPACE  $(oc get secrets -n $NAMESPACE | grep cp4waiops-eventprocessor-eve-29ee-ep-admin-user | awk '!/-min/' | awk '{print $1;}') -o jsonpath="{.data.username}"|base64 -d) ;
export password=$(oc get secret -n $NAMESPACE  $(oc get secrets -n $NAMESPACE | grep cp4waiops-eventprocessor-eve-29ee-ep-admin-user | awk '!/-min/' | awk '{print $1;}') -o jsonpath="{.data.password}"|base64 -d) ;
export URL=$(oc get routes flink-job-manager -n $NAMESPACE -o=jsonpath='{.status.ingress[0].host}{"\n"}')

echo "================================================================"
echo "URL : https://$URL"
echo "username : $username"
echo "PASSWORD : $password"
echo "================================================================"

echo "process completed ..... $(date)"
