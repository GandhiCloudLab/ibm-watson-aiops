#!/bin/bash

echo "process started ..... $(date)"

source ./00-config1.sh
source ./00-config2.sh
source ./00-util.sh

generateOutputFileName "indices.txt"

echo "The indices would be available in the file : $GLOBAL_OUTPUT_FILE_NAME"

curl -k -u $USERNAME:$PASSWORD -XGET $URL/_cat/indices | sort > $GLOBAL_OUTPUT_FILE_NAME

echo "process completed ..... $(date)"
