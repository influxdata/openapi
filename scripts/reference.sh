#!/bin/bash

CONTRACTS=${CONTRACTS:-contracts/ref}

mkdir -p $CONTRACTS

echo "Aggregating cloud swaggers"
docker run \
  --rm \
  -v ${PWD}:/openapi docker.io/glinton/swagrag \
  -file /openapi/contracts/priv/cloud-priv.yml \
  -file /openapi/contracts/cloud.yml \
  -file /openapi/contracts/priv/annotationd.yml \
  -file /openapi/contracts/priv/flowd.yml \
  -file /openapi/contracts/mapsd.yml \
  -file /openapi/contracts/managed-functions.yml \
  -api-title "Complete InfluxDB Cloud API" \
  > ${CONTRACTS}/cloud.yml

echo "Aggregating oss swaggers"
docker run \
  --rm \
  -v ${PWD}:/openapi docker.io/glinton/swagrag \
  -file /openapi/contracts/oss.yml \
  -file /openapi/contracts/mapsd.yml \
  -api-title "Complete InfluxDB OSS API" \
  > ${CONTRACTS}/oss.yml
