package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

labels: {
	post: {
		operationId: "PostLabels"
		tags: [
			"Labels",
		]
		summary: "Create a label"
		requestBody: {
			description: "Label to create"
			required:    true
			content: "application/json": schema: commonschemas.LabelCreateRequest.#Ref
		}
		responses: {
			"201": {
				description: "Added label"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	get: {
		operationId: "GetLabels"
		tags: [
			"Labels",
		]
		summary: "List all labels"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of labels"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
