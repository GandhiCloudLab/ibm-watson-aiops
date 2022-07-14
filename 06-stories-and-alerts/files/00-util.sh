#!/bin/bash

GLOBAL_OUTPUT_FILE_NAME=""

generateOutputFileName() {
    FILE_SUFFIX=$1

    mkdir -p ./data/output
    GLOBAL_OUTPUT_FILE_NAME=./data/output/output-$(date +"%Y-%m-%d-%H-%M-%S-%3N")-$FILE_SUFFIX
    echo "FILE_NAME : $GLOBAL_OUTPUT_FILE_NAME"
}
