#  Flink Jobs

This document helps to expose Flink Job URLs and view the the status of the available flink jobs in WAIOps.


#### 1. Login into OCP Cluster

Login into the OCP Cluster where WAIOps AIMgr is installed 
```
oc login ....
```

#### 2. Print Flink Job access details

Run the below script

```
sh files/00-create-print-flink-url.sh
```

As a result, Flink url and access details will be printed like the below.


```
================================================================
URL : https://flink-job-manager-cp4waiops.iaaaa.cloud
username : eventprocessing-admin
PASSWORD : Z1.................
================================================================
```

## 3. Access flink job UI

Using the above url, user, password access the Flink Job UI. It will show screens like the below.

<img src="images/image2.png">

Here snow-connect (servicenow) connection is shown.

This can be used to debug whether the data is flowing into WAIOps or not.