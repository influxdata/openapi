#!/bin/bash

CONTRACTS=${CONTRACTS:-/openapi/contracts}

mkdir -p $CONTRACTS

SERVICES='
	cloud
	oss
	common
	priv/cloud-priv
	priv/quartz-oem
	priv/unity
	svc-invocable-scripts
	svc-mapsd
	svc-datasourcesd
	priv/svc-annotationd
	priv/svc-annotationd-oss
	priv/svc-notebooksd
	priv/svc-pinneditemsd
'

echo generating all >&2
# generate all the API definitions at once so we don't do the validation work many times
(cd ./src && cue export -e '{"all": all}' -f -o $CONTRACTS/.all.yml)
trap "rm $CONTRACTS/.all.yml" 0

cd $CONTRACTS
RESULTS=''
for c in $SERVICES; do
	# TODO use a more consistent relationship between identifier
	# and destination path so we don't need this logic.
	id=$(basename $c)
	out="./$(dirname $c)/$(echo $id | sed 's/^svc-//').yml"
	echo generating $out >&2
	cue export -e "all.\"$id\"" -f -o $out .all.yml
	APIS="$APIS $out"
done

for api in $APIS; do
	swagger-cli validate $api
done
