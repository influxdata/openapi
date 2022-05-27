#!/bin/sh

CONTRACTS=${CONTRACTS:-/openapi/contracts}
TCONTRACTS=${TCONTRACTS:-/openapi/contracts}

mkdir -p $TCONTRACTS/ref

echo "Aggregating cloud swaggers"
swagrag \
  -file ${CONTRACTS}/cloud.yml \
  -file ${CONTRACTS}/legacy.yml \
  -file ${CONTRACTS}/mapsd.yml \
  -file ${CONTRACTS}/invocable-scripts.yml \
  -api-title "Complete InfluxDB Cloud API" \
  | sed -e 's|^  /api/v2/ping|  /ping|' \
  | sed -e 's|^  /api/v2/:|  /api/v2:|' \
  > ${TCONTRACTS}/ref/cloud.yml

echo "Aggregating oss swaggers"
swagrag \
  -file ${CONTRACTS}/oss.yml \
  -file ${CONTRACTS}/legacy.yml \
  -file ${CONTRACTS}/mapsd.yml \
  -api-title "Complete InfluxDB OSS API" \
  | sed -e 's|^  /api/v2/debug|  /debug|' \
  | sed -e 's|^  /api/v2/health|  /health|' \
  | sed -e 's|^  /api/v2/metrics|  /metrics|' \
  | sed -e 's|^  /api/v2/ping|  /ping|' \
  | sed -e 's|^  /api/v2/ready|  /ready|' \
  | sed -e 's|^  /api/v2/:|  /api/v2:|' \
  > ${TCONTRACTS}/ref/oss.yml

diff -r ${CONTRACTS}/ref ${TCONTRACTS}/ref/
