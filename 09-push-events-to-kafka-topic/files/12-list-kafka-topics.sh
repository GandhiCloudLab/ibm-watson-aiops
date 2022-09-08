#!/bin/bash

echo "process started ..... $(date)"

source ./01-config1.sh
source ./02-config2.sh

oc get kafkatopics -n $NAMESPACE

echo "process completed ..... $(date)"
