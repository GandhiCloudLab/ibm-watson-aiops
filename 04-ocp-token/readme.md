#  OCP Token

This document helps to create OpenShift token to use in Kube Observer.


#### 1. Login into OCP Cluster

Login into the OCP Cluster where WAIOps AIMgr is installed 
```
oc login ....
```

#### 2. Create Token

Run the below script

```
cd files
sh 01-create-ocp-token
```

As a result, it will print the token. This token can be used in Kubernetes Observer.


```
====================================================================================
eyJhb..................
====================================================================================
```

