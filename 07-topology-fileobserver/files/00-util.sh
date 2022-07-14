#!/usr/bin/env bash

RESULT_VALUE=test

echo "  started ..... $(date)"

source ./00-config1.sh
source ./00-config2.sh

uploadNewFile() {

    FILE_TO_UPLOAD=$1
    URL=$TOPO_API_URL/files

    echo "New File to upload ----> $FILE_TO_UPLOAD"

    curl    --request POST                                  \
            --url "${URL}"                                  \
            --insecure -u $TOPO_USER:$TOPO_PWD              \
            --form "job_file=@$FILE_TO_UPLOAD"              \
            --header "X-TenantID: $TOPO_TENENT_ID"          \
            --header "Content-Type: multipart/form-data"    \
            --header "Accept: application/json"
}

uploadExistingFile() {

    FILE_TO_UPLOAD=$1
    URL=$TOPO_API_URL/files

    echo "Existing File to upload ----> $FILE_TO_UPLOAD"

    curl    --request PUT                                  \
            --url "${URL}"                                  \
            --insecure -u $TOPO_USER:$TOPO_PWD              \
            --form "job_file=@$FILE_TO_UPLOAD"              \
            --header "X-TenantID: $TOPO_TENENT_ID"          \
            --header "Content-Type: multipart/form-data"    \
            --header "Accept: application/json"
}

### Not working
uploadForDelete() {

    FILE_TO_UPLOAD=$1
    URL=$TOPO_API_URL/files

    echo "Existing File to upload ----> $FILE_TO_UPLOAD"

    curl    --request DELETE                                  \
            --url "${URL}"                                  \
            --insecure -u $TOPO_USER:$TOPO_PWD              \
            --form "job_file=@$FILE_TO_UPLOAD"              \
            --header "X-TenantID: $TOPO_TENENT_ID"          \
            --header "Content-Type: multipart/form-data"    \
            --header "Accept: application/json"
}