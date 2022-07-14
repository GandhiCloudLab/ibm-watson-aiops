#!/bin/bash

echo "process started ..... $(date)"

echo "This process will create/overwrite config2.h with url, usr, pwd"

source ./00-config1.sh
source ./00-util.sh

oc create route passthrough elasticsearch -n $NAMESPACE --service=iaf-system-elasticsearch-es --port=9200

export USERNAME=$(oc get secret -n $NAMESPACE  $(oc get secrets -n $NAMESPACE | grep iaf-system-elasticsearch-es-default-user | awk '!/-min/' | awk '{print $1;}') -o jsonpath="{.data.username}"|base64 -d) ;
export PASSWORD=$(oc get secret -n $NAMESPACE  $(oc get secrets -n $NAMESPACE | grep iaf-system-elasticsearch-es-default-user | awk '!/-min/' | awk '{print $1;}') -o jsonpath="{.data.password}"|base64 -d) ;
export URL=$(oc get routes elasticsearch -n $NAMESPACE -o=jsonpath='{.status.ingress[0].host}{"\n"}')

echo "================================================================"
echo "URL : https://$URL"
echo "USERNAME : $USERNAME"
echo "PASSWORD : $PASSWORD"

echo "#!/bin/bash" > 00-config2.sh
echo "URL=https://$URL" >> 00-config2.sh
echo "URL_WITHOUT_HTTP=$URL" >> 00-config2.sh
echo "USERNAME=$USERNAME" >> 00-config2.sh
echo "PASSWORD=$PASSWORD">> 00-config2.sh

echo "================================================================"

echo "process completed ..... $(date)"
