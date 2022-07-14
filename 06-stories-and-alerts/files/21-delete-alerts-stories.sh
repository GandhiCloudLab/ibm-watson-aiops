#!/bin/bash

echo "process started ..... $(date)"

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

echo "=================== Stories ============================================="
curl "${URL_STORIES}" -X GET -u "${USER_PASS}" -H "x-username:admin" -H "x-subscription-id:cfd95b7e-3bc7-4006-a4a8-a73a79c71255"

echo "=================== Alerts ============================================="
curl "${URL_ALERTS}" -X GET -u "${USER_PASS}" -H "x-username:admin" -H "x-subscription-id:cfd95b7e-3bc7-4006-a4a8-a73a79c71255"


### Delete Stories
export result=$(curl "${URL_STORIES}" --insecure --silent -X PATCH -u "${USER_PASS}" -d '{"state": "resolved"}' -H 'Content-Type: application/json' -H "x-username:admin" -H "x-subscription-id:cfd95b7e-3bc7-4006-a4a8-a73a79c71255")
echo " Stories closed: "$(echo $result | jq ".affected")

### Delete Alerts
export result=$(curl "${URL_ALERTS}" --insecure --silent -X PATCH -u "${USER_PASS}" -d '{"state": "closed"}' -H 'Content-Type: application/json' -H "x-username:admin" -H "x-subscription-id:cfd95b7e-3bc7-4006-a4a8-a73a79c71255")
echo " Alerts closed: "$(echo $result | jq ".affected")


# ================================================================
# USER_PASS : aaaaa
# URL_STORIES : https://datalayer-api-cp4waiops.watson-aiops-aaaaa.cloud/irdatalayer.aiops.io/active/v1/stories
# URL_ALERTS : https://datalayer-api-cp4waiops.watson-aiops-aaaaa.cloud/irdatalayer.aiops.io/active/v1/alerts
# ================================================================

### Other Options ....
### https://gsicsi.slack.com/archives/C01L36KNJ4U/p1651250565998929

### Other Options 1....
# oc exec -ti aiops-ir-core-ncoprimary-0 -- bash
# cd /opt/IBM/tivoli/netcool/omnibus/bin/
# ./nco_sql -password $OMNIBUS_ROOT_PWD -username root  -server AGG_P_C
# > delete from aiops_irb.alerts;
# > go

### Other Options 2....

# curl --insecure -X PATCH -H "Content-Type:application/json" -H "Accept:application/json" --user "${API_AUTHSCHEME_STATICKEY_USERNAME}:${API_AUTHSCHEME_STATICKEY_PASSWORD}" "https://localhost:10011/irdatalayer.aiops.io/v1/cfd95b7e-3bc7-4006-a4a8-a73a79c71255/alerts" -d '{
#   "state": "closed"
# }'

echo "process completed ..... $(date)"