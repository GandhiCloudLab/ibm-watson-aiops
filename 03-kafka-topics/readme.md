#  Kafka topics

The logs, events, alerts are stored in Kafka topics. This document explains about how to access those kafka topics.


### Pre Requisite

Install `kcat` 

https://docs.confluent.io/platform/current/app-development/kafkacat-usage.html


### 1. Login into OCP Cluster

Login into the OCP Cluster where WAIOps AIMgr is installed 

```
oc login ....
```

### 2. Retrieve the config details.

Run the below script to get the config details in `config2.sh`. This file is automatcially updated by the script.

```
cd files
sh 00-get-config.sh
```

### 3. Retrieve list of kafka topics.

Run the below script to list the kafka topics available.

```
cd files
sh 01-get-kafka-topics.sh
```

The output could be like this.

```
NAME                                                                                                               CLUSTER      PARTITIONS   REPLICATION FACTOR   READY
consumer-offsets---84e7a678d08f4bd226872e5cdd4eb527fadc1c6a                                                        iaf-system   50           1                    True
cp4waiops-cartridge-applications                                                                                   iaf-system   1            1                    True
cp4waiops-cartridge-connections                                                                                    iaf-system   1            1                    True
cp4waiops-cartridge-logs-pw1klvuv-intermediate                                                                     iaf-system   2            1                    True
cp4waiops-cartridge-windowed-logs-1000-1000                                                                        iaf-system   24           1                    True
cp4waiops-cartridge.changerequest                                                                                  iaf-system   6            1                    True
cp4waiops-cartridge.connector-snow-actions                                                                         iaf-system   6            1                    True
cp4waiops-cartridge.incident                                                                                       iaf-system   6            1                    True
cp4waiops-cartridge.incidents                                                                                      iaf-system   6            1                    True
cp4waiops-cartridge.issue                                                                                          iaf-system   6            1                    True
cp4waiops-cartridge.lifecycle.input.alerts                                                                         iaf-system   24           1                    True
cp4waiops-cartridge.lifecycle.input.events                                                                         iaf-system   12           1                    True
cp4waiops-cartridge.lifecycle.input.stories                                                                        iaf-system   24           1                    True
cp4waiops-cartridge.lifecycle.output.connector-alerts                                                              iaf-system   6            1                    True
cp4waiops-cartridge.lifecycle.output.story-notifications                                                           iaf-system   24           1                    True
cp4waiops-cartridge.pr                                                                                             iaf-system   6            1                    True
cp4waiops-cartridge.problem                                                                                        iaf-system   6            1                    True
cp4waiops-cartridge.repository                                                                                     iaf-system   6            1                    True
cp4waiops-cartridge.snow-handlers                                                                                  iaf-system   6            1                    True
cp4waiops-cartridge.status                                                                                         iaf-system   6            1                    True

```

### Log Data flow

The incoming logs would go through the below kafka topics for the log anomaly detection. 

- cp4waiops-cartridge-windowed-logs-1000-1000
- cp4waiops-cartridge.lifecycle.input.events
- cp4waiops-cartridge.lifecycle.input.alerts

This is explained in the document [01-log-processing](../01-log-processing)

You  can run the below scripts separately to print the content of the above topics.

```
cd files
sh 31-view-topic-windowed-logs.sh
```

```
cd files
sh 32-view-lifecycle-input-events.sh
```

```
cd files
sh 33-view-lifecycle-input-alerts.sh
```

### View a selected Kafka topic

If you want see any particular kafka topic like `cp4waiops-cartridge-connections` you can pass this as an argument like this.

Run the below script
```
cd files
sh 20-view-topic-by-name.sh  cp4waiops-cartridge-connections 
```
