package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

variables_variableID_labels: {
	get: {
		operationId: "GetVariablesIDLabels"
		tags: [
			"Variables",
		]
		summary: "List all labels for a variable"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "variableID"
			schema: type: "string"
			required:    true
			description: "The variable ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a variable"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostVariablesIDLabels"
		tags: [
			"Variables",
		]
		summary: "Add a label to a variable"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "variableID"
			schema: type: "string"
			required:    true
			description: "The variable ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The newly added label"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
