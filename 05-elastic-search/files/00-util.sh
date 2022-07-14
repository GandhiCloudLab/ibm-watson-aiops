#!/bin/bash

GLOBAL_OUTPUT_FILE_NAME=""

generateOutputFileName() {
    FILE_SUFFIX=$1

    mkdir -p ./data/output
    GLOBAL_OUTPUT_FILE_NAME=./data/output/output-$(date +"%Y-%m-%d-%H-%M-%S-%3N")-$FILE_SUFFIX
    echo "FILE_NAME : $GLOBAL_OUTPUT_FILE_NAME"
}

printIndiceByName() {
    INDICES_NAME=$1
    echo "INDICES_NAME: $INDICES_NAME"
    generateOutputFileName "$INDICES_NAME.json"

    curl -k -u $USERNAME:$PASSWORD -XGET $URL/$INDICES_NAME/_search?pretty  > $GLOBAL_OUTPUT_FILE_NAME
}

downloadIndiceByName() {
    INDICES_NAME=$1
    echo "INDICES_NAME: $INDICES_NAME"
    generateOutputFileName "$INDICES_NAME.json"

    elasticdump --input=https://$USERNAME:$PASSWORD@$URL_WITHOUT_HTTP/$INDICES_NAME --output=$GLOBAL_OUTPUT_FILE_NAME --type=data;
}

uploadIndiceByName() {
    INDICES_NAME=$1
    UPLOAD_FILE_NAME=$2

    echo "INDICES_NAME: $INDICES_NAME"
    generateOutputFileName "$INDICES_NAME.json"

    elasticdump --input=$UPLOAD_FILE_NAME --output=https://$USERNAME:$PASSWORD@$URL_WITHOUT_HTTP/$INDICES_NAME --type=data;
}


deleteIndiceByName() {
    INDICES_NAME=$1
    echo "INDICES_NAME: $INDICES_NAME"

    curl -k -u $USERNAME:$PASSWORD -XDELETE $URL/$INDICES_NAME
}
