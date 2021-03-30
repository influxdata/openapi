.PHONY: generate
.PHONY: generate
generate:
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli sh /openapi/scripts/generate.sh

.PHONY: generate-svc
generate-svc:
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli sh /openapi/scripts/generate-svc.sh

.PHONY: generate-all
generate-all: generate generate-svc

.PHONY: test
test:
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli sh /openapi/scripts/test.sh

.PHONY: build-docker
build-docker:
	docker build -t quay.io/influxdb/swagger-cli -f scripts/openapi-cli.dockerfile .

.PHONY: publish-docker
publish-docker:
	docker push quay.io/influxdb/swagger-cli
