#  Print or Delete Stories

This script helps to print or delete stories

### 1. Login into OCP Cluster

Login into the OCP Cluster where WAIOps AIMgr is installed 

```
oc login ....
```

### 2. Export the stories

Run the below script to export all the current stories into `./data/output` folder

```
cd files
sh 10-print-alerts-stories.sh
```

### 3. Delete Stories

Run the below script to delete all the stories

```
cd files
sh 21-delete-alerts-stories.sh
```
