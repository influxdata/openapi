package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

telegraf_plugins: get: {
	operationId: "GetTelegrafPlugins"
	tags: ["Telegraf Plugins"]
	summary: "List all Telegraf plugins"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:          "query"
		name:        "type"
		description: "The type of plugin desired."
		schema: type: "string"
	}]
	responses: {
		"200": {
			description: "A list of Telegraf plugins."
			content: "application/json": schema: commonschemas.TelegrafPlugins.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
