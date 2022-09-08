#!/bin/bash

echo "process started ..... $(date)"

source ./config1.sh
source ./config2.sh

TOPIC_NAME=cp4waiops-cartridge-windowed-logs-1000-1000

kafkacat $SEC -b $BROKER -C -t $TOPIC_NAME

echo "process completed ..... $(date)"
