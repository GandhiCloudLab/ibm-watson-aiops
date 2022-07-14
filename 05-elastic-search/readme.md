#  Elastic Search

Elastic Search contains the data related to the training, data model and etc.

### 1. Login into OCP Cluster

Login into the OCP Cluster where WAIOps AIMgr is installed 

```
oc login ....
```

### 2. Retrieve the config details.

Run the below script to get the config details in `00-config2.sh`. This file is automatcially updated by the script.

```
cd files
sh 10-generate-url-usr-pwd.sh
```

### 3. Retrieve list of kafka topics.

Run the below script to list the list of indices.

```
cd files
sh 11-print-indices.sh
```

The output could be like this.

```
green  open .iaf_security                                                                                        iCAZ_k_lQ5KC17KGLH7Wxw 1 0      1    0   5.6kb   5.6kb
green  open 1000-1000-20220622-logtrain                                                                          XHcx4N-_SP-fDStskJiKlw 8 0 200494 5104  17.9mb  17.9mb
green  open 1000-1000-v1-applications                                                                            M82cRFKsSgm5n5AO_EHWwg 5 0      7    0  20.6kb  20.6kb
green  open 1000-1000-v1-embedding_pca_fe                                                                        _jSV7ePHQNC_c47oUtvtMw 5 0      5    0  30.9kb  30.9kb
green  open 1000-1000-v1-embedding_pca_model                                                                     blHlWwEtTt2UWhVgA1WBbg 5 0      5    0 139.5kb 139.5kb
green  open 1000-1000-v1-pca_fe                                                                                  zfrRikgJQvmYYujZH8hY1g 5 0      7    0  36.9kb  36.9kb
green  open 1000-1000-v1-pca_model                                                                               h36Z5j1xSxCf8AG92b8yUA 5 0      7    0  42.6kb  42.6kb
green  open 1000-1000-v1-templates                                                                               LV78Y60GRUykj6bwv520Dw 5 0     20    6 255.1kb 255.1kb
green  open 1000-1000-v1-training_count_vectors                                                                  8vYXBNiEQB2qOFb1gES4dQ 5 0    238    0  74.1kb  74.1kb
green  open aiops-searchservice_v10                                                                              02rkvZJFQW-5alyjPheJzA 5 0     90    0     3mb     3mb
green  open algorithmregistry                                                                                    hWSwxj8iR8eswghZqtMyYQ 1 0      9    0  69.2kb  69.2kb
green  open cp4waiops-cartridge-policyregistry.ibm-netcool-prod.aiops.cfd95b7e-3bc7-4006-a4a8-a73a79c71255       WUiqxJV1S4Kx7rwSdDDbmQ 5 0     39    0   5.3mb   5.3mb
green  open cp4waiops-cartridge-policyregistry.ibm-netcool-prod.aiops.stats.cfd95b7e-3bc7-4006-a4a8-a73a79c71255 O99SPwJ-QlKE2j6JA9nCEg 5 0      2   86 101.6kb 101.6kb
green  open dataset                                                                                              qysW-MSxSGmVWebw6fu6BQ 1 0      1    0   4.7kb   4.7kb
green  open postchecktrainingdetails                                                                             UyT8aavTQ3CcrOmN1xAyWA 1 0      0    0    226b    226b
green  open prechecktrainingdetails                                                                              rmm21TfQTUikU8dWY6qQUw 1 0      0    0    226b    226b
green  open trainingdefinition                                                                                   cFGzROM2R8K1Nirh9Ocleg 1 0      1    0  31.1kb  31.1kb
green  open trainingrun                                                                                          A06s31T9RDCH2_XirlUYrw 1 0      1    4   183kb   183kb
green  open trainingsrunning                                                                                     ihnfhY2FRViZI-n1u9-EpA 1 0      0    1   8.7kb   8.7kb
green  open trainingstatus                                                                                       tSqsa7tmTgubs36xSr8XoQ 1 0      7   56  40.9kb  40.9kb
yellow open 1000-1000-log_models_latest                                                                          uGZ0T1G5QcKgfy1g7wnvHg 1 1      1    0   3.9kb   3.9kb

```

### View a selected indice

If you want see any particular indice  `1000-1000-v1-applications` you can pass this as an argument like this.

Note: This will not print the entire file if indice is too big.

Run the below script
```
cd files
sh 13-print-indices-by-param.sh  cp4waiops-cartridge-connections 
```

The output could be like this. You can view the result in the `./data/output/output-2022-07-14-18-11-10-3N-1000-1000-v1-applications.json`

```
Jeyas-MacBook-Pro:files jeyagandhi$ sh 13-print-indices-by-param.sh 1000-1000-v1-applications
process started ..... Thu Jul 14 18:11:10 IST 2022
INDICES_NAME: 1000-1000-v1-applications
FILE_NAME : ./data/output/output-2022-07-14-18-11-10-3N-1000-1000-v1-applications.json
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1495  100  1495    0     0    567      0  0:00:02  0:00:02 --:--:--   571
process completed ..... Thu Jul 14 18:11:14 IST 2022
```

### Download selected indice

If you want download any particular indice ex: `1000-1000-v1-applications` content, you can  you can pass this as an argument like this.

Note: This will download the entire file even if indice is too big.


Run the below script
```
cd files
sh 20-download-indice-by-name.sh  1000-1000-v1-applications
```


### Updload selected indice data

If you want upload any particular indice ex: `1000-1000-v1-applications`, you can do like the below.

Run the below script
```
cd files
sh 21-upload-indice-by-name.sh 1000-1000-v1-applications /Users/jeyagandhi/temp/test.json
```

### Delete selected indice

If you want to delete any particular indice ex: `1000-1000-v1-applications`, you can do like the below.

Run the below script
```
cd files
sh 30-delete-indicies-by-param.sh 1000-1000-v1-applications
```
