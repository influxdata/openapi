package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

telegrafs_telegrafID: {
	get: {
		operationId: "GetTelegrafsID"
		tags: [
			"Telegrafs",
		]
		summary: "Retrieve a Telegraf configuration"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf configuration ID."
		}, {
			in:       "header"
			name:     "Accept"
			required: false
			schema: {
				type:    "string"
				default: "application/toml"
				enum: [
					"application/toml",
					"application/json",
					"application/octet-stream",
				]
			}
		}]
		responses: {
			"200": {
				description: "Telegraf configuration details"
				content: {
					"application/toml": {
						example: """
		[agent]
		interval = \"10s\"
		"""
						schema: type: "string"
					}
					"application/json": schema: commonschemas.Telegraf.#Ref
					"application/octet-stream": {
						example: """
		[agent]
		interval = \"10s\"
		"""
						schema: type: "string"
					}
				}
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	put: {
		operationId: "PutTelegrafsID"
		tags: [
			"Telegrafs",
		]
		summary: "Update a Telegraf configuration"
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
			description: "Telegraf configuration update to apply"
			required:    true
			content: "application/json": schema: commonschemas.TelegrafRequest.#Ref
		}
		responses: {
			"200": {
				description: "An updated Telegraf configurations"
				content: "application/json": schema: commonschemas.Telegraf.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteTelegrafsID"
		tags: [
			"Telegrafs",
		]
		summary: "Delete a Telegraf configuration"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf configuration ID."
		}]
		responses: {
			"204": description: "Delete has been accepted"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
