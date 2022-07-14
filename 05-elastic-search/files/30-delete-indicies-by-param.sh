#!/bin/bash

echo "process started ..... $(date)"

source ./00-config1.sh
source ./00-util.sh
source ./00-config2.sh

export NODE_TLS_REJECT_UNAUTHORIZED=0

INDICES_NAME=$1
deleteIndiceByName $INDICES_NAME

echo "process completed ..... $(date)"

