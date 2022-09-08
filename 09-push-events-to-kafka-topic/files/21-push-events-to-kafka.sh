#!/bin/bash

echo "process started ..... $(date)"

source ./01-config1.sh
source ./02-config2.sh

kcat -P $SEC -b $BROKER -t $TOPIC_NAME  -l ./data/test-event.json

echo "process completed ..... $(date)"
