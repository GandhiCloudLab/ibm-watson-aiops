#!/bin/bash

source ./00-config1.sh

echo "process started ..... $(date)"

TOPO_API_URL=$(oc get routes aiops-topology-file-observer  -n $NAMESPACE -o=jsonpath='{.status.ingress[0].host}{"\n"}')
TOPO_API_URL=https://$TOPO_API_URL/1.0/file-observer
TOPO_API_URL_SWAGGER=$TOPO_API_URL/swagger

TOPO_USER=$(oc get secret -n $NAMESPACE aiops-topology-asm-credentials -o jsonpath="{.data.username}"|base64 -d) ;
TOPO_PWD=$(oc get secret -n $NAMESPACE aiops-topology-asm-credentials -o jsonpath="{.data.password}"|base64 -d) ;
TOPO_TENENT_ID=cfd95b7e-3bc7-4006-a4a8-a73a79c71255
HEADER_TENENT_ID="X-TenantID: $TOPO_TENENT_ID"

echo "================================================================"
echo "TOPO_API_URL=$TOPO_API_URL"
echo "TOPO_API_URL_SWAGGER=$TOPO_API_URL_SWAGGER"
echo "TOPO_USER=$TOPO_USER"
echo "TOPO_PWD=$TOPO_PWD"
echo "TOPO_TENENT_ID=$TOPO_TENENT_ID"

echo "#!/bin/bash" > 00-config2.sh
echo "TOPO_API_URL=$TOPO_API_URL" >> 00-config2.sh
echo "TOPO_API_URL_SWAGGER=$TOPO_API_URL_SWAGGER" >> 00-config2.sh
echo "TOPO_USER=$TOPO_USER" >> 00-config2.sh
echo "TOPO_PWD=$TOPO_PWD" >> 00-config2.sh
echo "TOPO_TENENT_ID=$TOPO_TENENT_ID" >> 00-config2.sh

echo "================================================================"

echo "process completed ..... $(date)"