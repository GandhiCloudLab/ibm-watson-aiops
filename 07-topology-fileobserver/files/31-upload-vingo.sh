#!/usr/bin/env bash

source ./00-util.sh


echo "Upload file ..... "


TOPO_DATA_CENTER=file-vingo-dc
JOB_ID=file-vingo
PROVIDER=file-vingo
FILE_NAME="./data/file-vingo.txt"

uploadNewFile $FILE_NAME
