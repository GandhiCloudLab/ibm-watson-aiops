#!/bin/bash

echo "process started ..... $(date)"

source ./00-config1.sh
source ./00-config2.sh
source ./00-util.sh

INDICES_NAME=$1

printIndiceByName $INDICES_NAME

echo "process completed ..... $(date)"

