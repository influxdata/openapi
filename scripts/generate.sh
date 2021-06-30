#!/bin/sh

CONTRACTS=${CONTRACTS:-contracts}

# generate oss contract
sed -e '/#REF_COMMON_PATHS/{r ./src/common/_paths.yml' -e 'd}' src/oss.yml |
sed -e '/#REF_COMMON_PARAMETERS/{r ./src/common/_parameters.yml' -e 'd}' |
sed -e '/#REF_COMMON_SCHEMAS/{r ./src/common/_schemas.yml' -e 'd}' > src/.oss_gen.yml && \
swagger-cli bundle src/.oss_gen.yml --outfile ${CONTRACTS}/oss.yml --type yaml && \
swagger-cli bundle src/.oss_gen.yml --outfile ${CONTRACTS}/oss.json --type json && \
rm src/.oss_gen.yml

# generate cloud contract
sed -e '/#REF_COMMON_PATHS/{r ./src/common/_paths.yml' -e 'd}' src/cloud.yml |
sed -e '/#REF_COMMON_PARAMETERS/{r ./src/common/_parameters.yml' -e 'd}' |
sed -e '/#REF_COMMON_SCHEMAS/{r ./src/common/_schemas.yml' -e 'd}' > ./src/.cloud_gen.yml && \
swagger-cli bundle src/.cloud_gen.yml --outfile ${CONTRACTS}/cloud.yml --type yaml && \
swagger-cli bundle src/.cloud_gen.yml --outfile ${CONTRACTS}/cloud.json --type json && \
rm src/.cloud_gen.yml

# generate common-only contract
sed -e '/#REF_COMMON_PATHS/{r ./src/common/_paths.yml' -e 'd}' src/common.yml |
sed -e '/#REF_COMMON_PARAMETERS/{r ./src/common/_parameters.yml' -e 'd}' |
sed -e '/#REF_COMMON_SCHEMAS/{r ./src/common/_schemas.yml' -e 'd}' > src/.common_gen.yml && \
swagger-cli bundle src/.common_gen.yml --outfile ${CONTRACTS}/common.yml --type yaml && \
rm src/.common_gen.yml

# generate platform-specific contracts
swagger-cli bundle src/oss.yml --outfile ${CONTRACTS}/oss-diff.yml --type yaml
swagger-cli bundle src/cloud.yml --outfile ${CONTRACTS}/cloud-diff.yml --type yaml

## private apis

# generate cloud-priv contract
swagger-cli bundle src/cloud-priv.yml --outfile ${CONTRACTS}/priv/cloud-priv.yml --type yaml

# generate quartz-oem contract
swagger-cli bundle src/quartz-oem.yml --outfile ${CONTRACTS}/priv/quartz-oem.yml --type yaml

# generate unity contract
swagger-cli bundle src/unity.yml --outfile ${CONTRACTS}/priv/unity.yml --type yaml

# The following server replacements are intended to simplify definition maintenance and should
# only be used if there is no difference between an internal service api and it's external one.
# Once there are differences, this may change, but until that time, this should work well.

## public external service contracts

# managed-functions
sed -e "s|^  - url: '/'|  - url: '/api/v2'|" src/svc-managed-functions.yml | \
sed -e "s|'/functions|'/poc-functions|" > ./src/.svc.yml && \
swagger-cli bundle src/.svc.yml --outfile ${CONTRACTS}/managed-functions.yml --type yaml && \
rm src/.svc.yml

# mapsd
sed -e "s|^  - url: /api/v1|  - url: /api/v2/maps|" src/svc-mapsd.yml > ./src/.svc.yml && \
swagger-cli bundle src/.svc.yml --outfile ${CONTRACTS}/mapsd.yml --type yaml && \
rm src/.svc.yml

# datasourcesd
sed -e "s|^  - url: '/'|  - url: /api/v2/datasources|" src/svc-datasourcesd.yml > ./src/.svc.yml && \
swagger-cli bundle src/.svc.yml --outfile ${CONTRACTS}/datasourcesd.yml --type yaml && \
rm src/.svc.yml

## private external service contracts

# annotationd
sed -e "s|^  - url: /|  - url: '/api/v2private'|" src/svc-annotationd.yml > ./src/.svc.yml && \
swagger-cli bundle src/.svc.yml --outfile ${CONTRACTS}/priv/annotationd.yml --type yaml && \
rm src/.svc.yml

# annotationd-oss
sed -e "s|^  - url: /|  - url: '/api/v2private'|" src/svc-annotationd-oss.yml > ./src/.svc.yml && \
swagger-cli bundle src/.svc.yml --outfile ${CONTRACTS}/priv/annotationd-oss.yml --type yaml && \
rm src/.svc.yml

# notebooksd
sed -e "s|^  - url: /|  - url: '/api/v2private'|" src/svc-notebooksd.yml > ./src/.svc.yml && \
swagger-cli bundle src/.svc.yml --outfile ${CONTRACTS}/priv/notebooksd.yml --type yaml && \
rm src/.svc.yml
