package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

sources: {
	post: {
		operationId: "PostSources"
		tags: [
			"Sources",
		]
		summary: "Create a source"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Source to create"
			required:    true
			content: "application/json": schema: commonschemas.Source.#Ref
		}
		responses: {
			"201": {
				description: "Created Source"
				content: "application/json": schema: commonschemas.Source.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	get: {
		operationId: "GetSources"
		tags: [
			"Sources",
		]
		summary: "List all sources"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of sources"
				content: "application/json": schema: commonschemas.Sources.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
