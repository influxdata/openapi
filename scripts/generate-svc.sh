#!/bin/sh

# generate svc contracts
for i in $(ls ./src/svc); do
  swagger-cli bundle "src/svc-${i}.yml" --outfile "contracts/svc/${i}.yml" --type yaml
done
