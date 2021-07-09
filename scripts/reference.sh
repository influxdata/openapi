#!/bin/sh

CONTRACTS=${CONTRACTS:-/openapi/contracts}
TCONTRACTS=${TCONTRACTS:-/openapi/contracts}

mkdir -p $TCONTRACTS/ref

echo "Aggregating cloud swaggers"
swagrag \
  -file ${CONTRACTS}/priv/cloud-priv.yml \
  -file ${CONTRACTS}/cloud.yml \
  -file ${CONTRACTS}/priv/annotationd.yml \
  -file ${CONTRACTS}/mapsd.yml \
  -file ${CONTRACTS}/managed-functions.yml \
  -api-title "Complete InfluxDB Cloud API" \
  > ${TCONTRACTS}/ref/cloud.yml

echo "Aggregating oss swaggers"
swagrag \
  -file ${CONTRACTS}/oss.yml \
  -file ${CONTRACTS}/mapsd.yml \
  -api-title "Complete InfluxDB OSS API" \
  > ${TCONTRACTS}/ref/oss.yml

echo "Fixing /ping path"
sed -i '' -e "s|^  /api/v2/ping|  /ping|" ${TCONTRACTS}/ref/cloud.yml
sed -i '' -e "s|^  /api/v2/ping|  /ping|" ${TCONTRACTS}/ref/oss.yml

diff -r ${CONTRACTS}/ref ${TCONTRACTS}/ref/
