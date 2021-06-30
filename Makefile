.PHONY: generate
generate:
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli sh /openapi/scripts/generate.sh
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagrag-ci sh /openapi/scripts/reference.sh

.PHONY: generate-svc
generate-svc:
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli sh /openapi/scripts/generate-svc.sh

.PHONY: generate-all
generate-all: generate generate-svc

.PHONY: test
test:
	docker run --rm -v ${PWD}:/openapi quay.io/influxdb/swagger-cli sh /openapi/scripts/test.sh
	docker run --rm -e TCONTRACTS=/tmp/contracts -v ${PWD}:/openapi quay.io/influxdb/swagrag-ci sh /openapi/scripts/reference.sh

.PHONY: test-oats
test-oats:
	docker run --rm -it -e CONTRACTS -e TS -e GEN_TS -e DIFF_TS -v ${PWD}:/src/openapi quay.io/influxdb/oats /src/openapi/scripts/test-oats.sh

.PHONY: build-oats
build-oats:
	docker build -t quay.io/influxdb/oats -f scripts/oats.dockerfile .

.PHONY: publish-oats
publish-oats:
	docker push quay.io/influxdb/oats

.PHONY: build-swagger
build-swagger:
	docker build -t quay.io/influxdb/swagger-cli -f scripts/swagger-cli.dockerfile .

.PHONY: publish-swagger
publish-swagger:
	docker push quay.io/influxdb/swagger-cli

.PHONY: build-docker
build-docker: build-oats build-swagger

.PHONY: publish-docker
publish-docker: publish-oats publish-swagger

.PHONY: publish-docker-ci
publish-docker-ci:
	docker build -t quay.io/influxdb/swagger-cli-ci -f scripts/ci-swagger-cli.dockerfile .
	docker build -t quay.io/influxdb/oats-ci -f scripts/ci-oats.dockerfile .
	docker build -t quay.io/influxdb/swagrag-ci -f scripts/ci-swagrag.dockerfile .
	docker push quay.io/influxdb/swagger-cli-ci
	docker push quay.io/influxdb/oats-ci
	docker push quay.io/influxdb/swagrag-ci
