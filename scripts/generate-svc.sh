#!/bin/sh

CONTRACTS=${CONTRACTS:-contracts}

# generate svc contracts
for i in $(ls ./src/svc); do
  swagger-cli bundle "src/svc-${i}.yml" --outfile "${CONTRACTS}/svc/${i}.yml" --type yaml
done
