package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

labels_labelID: {
	get: {
		operationId: "GetLabelsID"
		tags: [
			"Labels",
		]
		summary: "Retrieve a label"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "labelID"
			schema: type: "string"
			required:    true
			description: "The ID of the label to update."
		}]
		responses: {
			"200": {
				description: "A label"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchLabelsID"
		tags: [
			"Labels",
		]
		summary: "Update a label"
		requestBody: {
			description: "Label update"
			required:    true
			content: "application/json": schema: commonschemas.LabelUpdate.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "labelID"
			schema: type: "string"
			required:    true
			description: "The ID of the label to update."
		}]
		responses: {
			"200": {
				description: "Updated label"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			"404": {
				description: "Label not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteLabelsID"
		tags: [
			"Labels",
		]
		summary: "Delete a label"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "labelID"
			schema: type: "string"
			required:    true
			description: "The ID of the label to delete."
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"404": {
				description: "Label not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
