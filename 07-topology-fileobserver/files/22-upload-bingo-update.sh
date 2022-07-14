#!/usr/bin/env bash

source ./00-util.sh


echo "Upload file ..... "


TOPO_DATA_CENTER=file-bingo-dc
JOB_ID=file-bingo
PROVIDER=file-bingo
FILE_NAME="./data/file-bingo.txt"

uploadExistingFile $FILE_NAME

