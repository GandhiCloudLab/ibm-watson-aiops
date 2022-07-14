#!/bin/bash

echo "process started ..... $(date)"

source ./config1.sh

mkdir data

oc extract secret/iaf-system-cluster-ca-cert  -n $NAMESPACE --keys=ca.crt --to=-> ./data/ca.crt

export SASL_PASSWORD=$(oc get secret $SASL_USERNAME  -n $NAMESPACE --template={{.data.password}} | base64 --decode)
export SEC="-X security.protocol=SASL_SSL -X ssl.ca.location=./data/ca.crt -X sasl.mechanisms=SCRAM-SHA-512 -X sasl.username=$SASL_USERNAME -X sasl.password=$SASL_PASSWORD"
export BROKER=$(oc get routes iaf-system-kafka-bootstrap -n $NAMESPACE -o=jsonpath='{.status.ingress[0].host}{"\n"}'):443


echo "#!/bin/bash" > config2.sh
echo "### This file is generated through script 00-get-config.sh"  >> config2.sh
echo "SASL_PASSWORD=$SASL_PASSWORD"  >> config2.sh
echo "SEC=\"$SEC\""  >> config2.sh
echo "BROKER=\"$BROKER\""  >> config2.sh


echo "================================================================"
echo "SASL_PASSWORD : $SASL_PASSWORD"
echo "SEC : $SEC"
echo "BROKER : $BROKER"
echo "================================================================"

echo "process completed ..... $(date)"
