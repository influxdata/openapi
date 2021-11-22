package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

telegrafs_telegrafID_labels: {
	get: {
		operationId: "GetTelegrafsIDLabels"
		tags: [
			"Telegrafs",
		]
		summary: "List all labels for a Telegraf config"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a Telegraf config"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTelegrafsIDLabels"
		tags: [
			"Telegrafs",
		]
		summary: "Add a label to a Telegraf config"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The label added to the Telegraf config"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
