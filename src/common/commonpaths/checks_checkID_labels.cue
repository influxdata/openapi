package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

checks_checkID_labels: {
	get: {
		operationId: "GetChecksIDLabels"
		tags: [
			"Checks",
		]
		summary: "List all labels for a check"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a check"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostChecksIDLabels"
		tags: [
			"Checks",
		]
		summary: "Add a label to a check"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "checkID"
			schema: type: "string"
			required:    true
			description: "The check ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The label was added to the check"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
