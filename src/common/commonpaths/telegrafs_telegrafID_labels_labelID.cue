package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

telegrafs_telegrafID_labels_labelID: delete: {
	operationId: "DeleteTelegrafsIDLabelsID"
	tags: [
		"Telegrafs",
	]
	summary: "Delete a label from a Telegraf config"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "telegrafID"
		schema: type: "string"
		required:    true
		description: "The Telegraf config ID."
	}, {
		in:   "path"
		name: "labelID"
		schema: type: "string"
		required:    true
		description: "The label ID."
	}]
	responses: {
		"204": description: "Delete has been accepted"
		"404": {
			description: "Telegraf config not found"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
