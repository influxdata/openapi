package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)
me: get: {
	operationId: "GetMe"
	tags: [
		"Accounts",
		"Operators",
		"Regions",
		"Organizations",
	]
	responses: {
		"200": {
			description: "congregated meta data for an individual account and org"
			content: "application/json": schema: unityschemas.Me.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Cannot get account or organization for user"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
