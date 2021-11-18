package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

sources_sourceID_buckets: get: {
	operationId: "GetSourcesIDBuckets"
	tags: [
		"Sources",
		"Buckets",
	]
	summary: "Get buckets in a source"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "sourceID"
		schema: type: "string"
		required:    true
		description: "The source ID."
	}, {
		in:          "query"
		name:        "org"
		description: "The name of the organization."
		schema: type: "string"
	}]
	responses: {
		"200": {
			description: "A source"
			content: "application/json": schema: commonschemas.Buckets.#Ref
		}
		"404": {
			description: "Source not found"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
