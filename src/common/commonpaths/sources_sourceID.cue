package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

sources_sourceID: {
	delete: {
		operationId: "DeleteSourcesID"
		tags: [
			"Sources",
		]
		summary: "Delete a source"
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
			"204": description: "Delete has been accepted"
			"404": {
				description: "View not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchSourcesID"
		tags: [
			"Sources",
		]
		summary: "Update a Source"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "sourceID"
			schema: type: "string"
			required:    true
			description: "The source ID."
		}]
		requestBody: {
			description: "Source update"
			required:    true
			content: "application/json": schema: commonschemas.Source.#Ref
		}
		responses: {
			"200": {
				description: "Created Source"
				content: "application/json": schema: commonschemas.Source.#Ref
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
	get: {
		operationId: "GetSourcesID"
		tags: [
			"Sources",
		]
		summary: "Retrieve a source"
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
				description: "A source"
				content: "application/json": schema: commonschemas.Source.#Ref
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
}
