.PHONY: generate
generate:
	docker run --rm -v ${PWD}:/src  quay.io/influxdb/swagger-cli bundle src/oss.yml --outfile contracts/oss.yml --type yaml
	docker run --rm -v ${PWD}:/src  quay.io/influxdb/swagger-cli bundle src/cloud.yml --outfile contracts/cloud.yml --type yaml

.PHONY: build-docker
build-docker:
	docker build -t quay.io/influxdb/swagger-cli -f scripts/openapi-cli.dockerfile .

.PHONY: publish-docker
publish-docker:
	docker push quay.io/influxdb/swagger-cli
