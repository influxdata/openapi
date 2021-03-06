#!/bin/sh

export TMP_DIR=/tmp/openapiTest
export CUR_DIR=$(dirname "$0")
export CONTRACTS=$TMP_DIR

# aggregate contracts from simple definitions
sh $CUR_DIR/generate.sh
sh $CUR_DIR/generate-svc.sh

# copy non-compiled contract and readme
cp $(pwd)/contracts/swaggerV1Compat.yml $CONTRACTS/
cp $(pwd)/contracts/README.md $CONTRACTS/
cp -a $(pwd)/contracts/ref $CONTRACTS/ref

diff -r $CONTRACTS $(pwd)/contracts
if [ "$?" -ne "0" ]; then
    echo "err: aggregated contract mismatch"
    exit 1
fi

if [ ! -z "$STRICT" ]; then
    for contract in $(find ${CONTRACTS} -iname *.yml ); do
        echo "ensuring ${contract} contains valid swagger..."
        swagger-cli validate ${contract}
    done
fi
