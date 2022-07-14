#!/bin/bash

echo "process started ..... $(date)"

source ./config1.sh
source ./config2.sh

oc get kafkatopics -n $NAMESPACE

echo "process completed ..... $(date)"
