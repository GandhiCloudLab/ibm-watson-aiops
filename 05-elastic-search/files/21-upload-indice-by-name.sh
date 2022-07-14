#!/bin/bash

echo "process started ..... $(date)"

source ./00-config1.sh
source ./00-config2.sh
source ./00-util.sh

export NODE_TLS_REJECT_UNAUTHORIZED=0

INDICES_NAME=$1
UPLOAD_FILE_NAME=$2
uploadIndiceByName $INDICES_NAME $UPLOAD_FILE_NAME

echo "process completed ..... $(date)"

