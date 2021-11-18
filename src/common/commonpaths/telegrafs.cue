package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

telegrafs: {
	get: {
		operationId: "GetTelegrafs"
		tags: [
			"Telegrafs",
		]
		summary: "List all Telegraf configurations"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID the Telegraf config belongs to."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of Telegraf configurations"
				content: "application/json": schema: commonschemas.Telegrafs.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTelegrafs"
		tags: [
			"Telegrafs",
		]
		summary: "Create a Telegraf configuration"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Telegraf configuration to create"
			required:    true
			content: "application/json": schema: commonschemas.TelegrafRequest.#Ref
		}
		responses: {
			"201": {
				description: "Telegraf configuration created"
				content: "application/json": schema: commonschemas.Telegraf.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
