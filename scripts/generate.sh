#!/bin/sh

# generate oss contract
sed -e '/REF_COMMON_PATHS/{r ./src/common/_paths.yml' -e 'd}' src/oss.yml > src/.oss_gen.yml && \
sed -i -e '/REF_COMMON_PARAMETERS/{r ./src/common/_parameters.yml' -e 'd}' src/.oss_gen.yml && \
sed -i -e '/REF_COMMON_SCHEMAS/{r ./src/common/_schemas.yml' -e 'd}' src/.oss_gen.yml && \
swagger-cli bundle src/.oss_gen.yml --outfile contracts/oss.yml --type yaml && \
rm src/.oss_gen.yml

# generate cloud contract
sed -e '/REF_COMMON_PATHS/{r ./src/common/_paths.yml' -e 'd}' src/cloud.yml > ./src/.cloud_gen.yml && \
sed -i -e '/REF_COMMON_PARAMETERS/{r ./src/common/_parameters.yml' -e 'd}' src/.cloud_gen.yml && \
sed -i -e '/REF_COMMON_SCHEMAS/{r ./src/common/_schemas.yml' -e 'd}' src/.cloud_gen.yml && \
swagger-cli bundle src/.cloud_gen.yml --outfile contracts/cloud.yml --type yaml && \
rm src/.cloud_gen.yml

# generate cloud-priv contract
swagger-cli bundle src/cloud-priv.yml --outfile contracts/cloud-priv.yml --type yaml
