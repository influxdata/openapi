package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

query_analyze: post: {
	operationId: "PostQueryAnalyze"
	tags: [
		"Query",
	]
	summary: "Analyze a Flux query"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "header"
		name: "Content-Type"
		schema: {
			type: "string"
			enum: [
				"application/json",
			]
		}
	}]
	requestBody: {
		description: "Flux query to analyze"
		content: "application/json": schema: commonschemas.Query.#Ref
	}
	responses: {
		"200": {
			description: "Query analyze results. Errors will be empty if the query is valid."
			content: "application/json": schema: commonschemas.AnalyzeQueryResponse.#Ref
		}
		default: {
			description: "Internal server error"
			headers: {
				"X-Influx-Error": {
					description: "Error string describing the problem"
					schema: type: "string"
				}
				"X-Influx-Reference": {
					description: "Reference code unique to the error type"
					schema: type: "integer"
				}
			}
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
