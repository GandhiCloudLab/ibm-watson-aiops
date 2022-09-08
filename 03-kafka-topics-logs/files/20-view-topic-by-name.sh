#!/bin/bash

echo "process started ..... $(date)"

source ./config1.sh
source ./config2.sh

TOPIC_NAME=$1

kcat $SEC -b $BROKER -C -t $TOPIC_NAME

echo "process completed ..... $(date)"
