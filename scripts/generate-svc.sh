#!/bin/sh

CONTRACTS=${CONTRACTS:-contracts}

# generate svc contracts
for i in $(ls -d ./src/svc/*/); do
  SERVICE=$(basename ${i})
  swagger-cli bundle "src/svc-${SERVICE}.yml" --outfile "${CONTRACTS}/svc/${SERVICE}.yml" --type yaml
done
