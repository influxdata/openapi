package unitypaths

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

sso: get: {
	operationId: "GetConnection"
	tags: [
		"Connection",
	]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "query"
		name: "email"
		schema: {
			type:   "string"
			format: "email"
		}
		required:    true
		description: "The email to get connection for."
	}]
	responses: {
		"200": {
			content: "application/json": schema: {
				type:    "string"
				example: "connection"
			}
			description: "Connection name as string"
		}
		"204": description: "No connection for the specified email"
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
	summary: "Get connection  for the specified email"
}
