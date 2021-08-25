#!/bin/sh

set -e

# How to run locally:
#
# docker run --rm -it -e CONTRACTS=/local/contracts -v "${PWD}:/local" openapitools/openapi-generator-cli /local/scripts/test-openapi.sh
#

CONTRACTS=${CONTRACTS:-openapi/contracts}

/usr/local/bin/docker-entrypoint.sh validate -i "${CONTRACTS}/oss.yml"
/usr/local/bin/docker-entrypoint.sh validate -i "${CONTRACTS}/cloud.yml"