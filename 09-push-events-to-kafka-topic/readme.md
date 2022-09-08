#  Pushing Events to Watson AIOps Kafka topics

This document explains about how to push events to IBM Watson AIOPs kafka topics. This is based on version 3.4.0

## Pre Requisite

Install `kcat` 

https://docs.confluent.io/platform/current/app-development/kafkacat-usage.html


## 1. Prepartion


#### 1. Get the Kafka topic name

Get the Kafka topic name created in WAIOps.

![Kafka](../images/image1.png)

#### 2. Update Properties

Update above identified kafka topic in the `TOPIC_NAME` property of the [./files/01-config1.sh](./files/01-config1.sh) 

```
TOPIC_NAME=cp4waiops-cartridge-alerts-none-z5ua2end
```

#### 3. Login into OCP Cluster

Login into the OCP Cluster where WAIOps AIMgr is installed 

```
oc login ....
```

#### 4. Retrieve the config details.

Run the below script to get the config details in [./files/02-config2.sh](./files/02-config2.sh). This file is automatcially updated by the script.

```
cd files
sh 11-generate-config.sh
```

## 2. Pushing Events

#### Sample Event

The same event is available in the [./files/data/test-event.json](./files/data/test-event.json)

#### Push Event

Run the below command to push the sample event to kafka topic.

```
cd files
sh 21-push-events-to-kafka.sh
```

#### View Results

The pushed events can be seen in Alerts Viewer as below.

![Kafka](../images/image2.png)
``

## Appendix

#### 1. Retrieve list of kafka topics.

Run the below script to list the kafka topics available.

```
cd files
sh 12-list-kafka-topics.sh
```

The output could be like this.

```
NAME                                                                                                               CLUSTER      PARTITIONS   REPLICATION FACTOR   READY
cp4waiops-cartridge-alerts-none-z5ua2end                                                                           iaf-system   1            1                    True
cp4waiops-cartridge-applications                                                                                   iaf-system   1            1                    True
cp4waiops-cartridge-change-risk-api-request                                                                        iaf-system   1            1                    True
cp4waiops-cartridge-change-risk-api-response                                                                       iaf-system   1            1                    True
cp4waiops-cartridge-change-risk-mgmt                                                                               iaf-system   1            1                    True
cp4waiops-cartridge-connections                                                                                    iaf-system   1            1                    True
cp4waiops-cartridge-windowed-logs-1000-1000                                                                        iaf-system   24           1                    True
cp4waiops-cartridge.aiops.policyregistry.policies                                                                  iaf-system   24           1                    True
cp4waiops-cartridge.aiops.policyregistry.policies.logstash                                                         iaf-system   24           1                    True
cp4waiops-cartridge.commit                                                                                         iaf-system   6            1                    True
cp4waiops-cartridge.incident                                                                                       iaf-system   6            1                    True
cp4waiops-cartridge.incidents                                                                                      iaf-system   6            1                    True
cp4waiops-cartridge.issue                                                                                          iaf-system   6            1                    True
cp4waiops-cartridge.lifecycle.input.alerts                                                                         iaf-system   24           1                    True
cp4waiops-cartridge.lifecycle.input.events                                                                         iaf-system   12           1                    True
cp4waiops-cartridge.lifecycle.input.stories                                                                        iaf-system   24           1                    True
cp4waiops-cartridge.pr                                                                                             iaf-system   6            1                    True
cp4waiops-cartridge.problem                                                                                        iaf-system   6            1                    True
cp4waiops-cartridge.snow-handlers                                                                                  iaf-system   6            1                    True
cp4waiops-cartridge.status                                                                                         iaf-system   6            1                    True
........
........
........
```

#### 2. Retrieve the content of the kafka topics.

You  can run the below scripts separately to print the content of the kafka topics.

```
cd files
sh 31-view-events-topic.sh
```
