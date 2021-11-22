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

echo - generating all >&2
# generate all the API definitions at once so we don't do the validation work many times
(cd ./src && cue export -e '{"all": all}' -f -o $CONTRACTS/.all.yml)
trap "rm -f $CONTRACTS/.all.yml" 0

cd $CONTRACTS
RESULTS=''
echo - exporting API files >&2
for c in $SERVICES; do
	# TODO use a more consistent relationship between identifier
	# and destination path so we don't need this logic.
	id=$(basename $c)
	out="./$(dirname $c)/$(echo $id | sed 's/^svc-//').yml"
	cue export -e "all.\"$id\"" -f -o $out .all.yml
	APIS="$APIS $out"
done

echo - validating generated APIs >&2
for api in $APIS; do
	swagger-cli validate $api > /dev/null || {
		echo $api failed validation >&2
		echo >&2
	}
done
