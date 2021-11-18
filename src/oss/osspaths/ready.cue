package osspaths

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

ready: get: {
	operationId: "GetReady"
	tags: [
		"Ready",
	]
	summary: "Get the readiness of an instance at startup"
	servers: [{
		url: ""
	}]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"200": {
			description: "The instance is ready"
			content: "application/json": schema: commonschemas.Ready.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
