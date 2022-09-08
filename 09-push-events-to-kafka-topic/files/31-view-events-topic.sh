#!/bin/bash

echo "process started ..... $(date)"

source ./01-config1.sh
source ./02-config2.sh

kcat $SEC -b $BROKER -C -t $TOPIC_NAME

echo "process completed ..... $(date)"
