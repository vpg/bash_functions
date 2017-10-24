#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$DIR/logs.sh";

# Returning an array of the indexes that are present in prod
#
# @return Returns an arra of indexes
function vpgGetIndexes {
    echo $indexJson | jq -r 'keys|.[]'
}

# Returning an array of the types of the index passed in param
#
# @return Returns an array of indexes
function vpgGetTypes {
    local index=$1;

    if [ "$#" -ne 1 ]; then
        vpgError "You have to pass 1 parameter : index name"
        exit 1;
    fi

    echo $indexJson | jq -r ".[\"$index\"].mappings|keys|.[]" | grep -v "_default_"
}

# Set the elasticsearch server Reference
function setElasticServer {
    ELSREF=$1
    indexJson=$(curl --silent "http://${ELSREF}/_mapping")
}

setElasticServer "vp-elasticsearch:9200"
