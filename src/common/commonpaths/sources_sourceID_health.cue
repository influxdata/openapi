package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

sources_sourceID_health: get: {
	operationId: "GetSourcesIDHealth"
	tags: [
		"Sources",
	]
	summary: "Get the health of a source"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "sourceID"
		schema: type: "string"
		required:    true
		description: "The source ID."
	}]
	responses: {
		"200": {
			description: "The source is healthy"
			content: "application/json": schema: commonschemas.HealthCheck.#Ref
		}
		"503": {
			description: "The source is not healthy"
			content: "application/json": schema: commonschemas.HealthCheck.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
