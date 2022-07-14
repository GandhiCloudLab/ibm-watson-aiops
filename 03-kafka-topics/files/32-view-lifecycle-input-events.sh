#!/bin/bash

echo "process started ..... $(date)"

source ./config1.sh
source ./config2.sh

TOPIC_NAME=cp4waiops-cartridge.lifecycle.input.events

kcat $SEC -b $BROKER -C -t $TOPIC_NAME

echo "process completed ..... $(date)"
