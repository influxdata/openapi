package osspaths

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonresponses"

)

health: get: {
	operationId: "GetHealth"
	tags: [
		"Health",
	]
	summary: "Get the health of an instance"
	servers: [{
		url: ""
	}]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"200": {
			description: "The instance is healthy"
			content: "application/json": schema: commonschemas.HealthCheck.#Ref
		}
		"503": {
			description: "The instance is unhealthy"
			content: "application/json": schema: commonschemas.HealthCheck.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
