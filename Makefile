.PHONY: generate
generate:
	sed -e '/REF_COMMON_PATHS/{r ./src/common/_paths.yml' -e 'd}' src/oss.yml > src/.oss_gen.yml
	sed -i -e '/REF_COMMON_PARAMETERS/{r ./src/common/_parameters.yml' -e 'd}' src/.oss_gen.yml
	sed -i -e '/REF_COMMON_SCHEMAS/{r ./src/common/_schemas.yml' -e 'd}' src/.oss_gen.yml
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli bundle src/.oss_gen.yml --outfile contracts/oss.yml --type yaml
	rm src/.oss_gen.yml
	sed -e '/REF_COMMON_PATHS/{r ./src/common/_paths.yml' -e 'd}' src/cloud.yml > ./src/.cloud_gen.yml
	sed -i -e '/REF_COMMON_PARAMETERS/{r ./src/common/_parameters.yml' -e 'd}' src/.cloud_gen.yml
	sed -i -e '/REF_COMMON_SCHEMAS/{r ./src/common/_schemas.yml' -e 'd}' src/.cloud_gen.yml
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli bundle src/.cloud_gen.yml --outfile contracts/cloud.yml --type yaml
	rm src/.cloud_gen.yml

.PHONY: build-docker
build-docker:
	docker build -t quay.io/influxdb/swagger-cli -f scripts/openapi-cli.dockerfile .

.PHONY: publish-docker
publish-docker:
	docker push quay.io/influxdb/swagger-cli
