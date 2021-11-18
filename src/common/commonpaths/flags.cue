package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

flags: get: {
	operationId: "GetFlags"
	tags: [
		"Users",
	]
	summary: "Return the feature flags for the currently authenticated user"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"200": {
			description: "Feature flags for the currently authenticated user"
			content: "application/json": schema: commonschemas.Flags.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
