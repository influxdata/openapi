package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

accounts: get: {
	operationId: "GetAccounts"
	tags: [
		"Accounts",
	]
	summary: "Get the list of accounts for the current user"
	responses: {
		"200": {
			description: "Accounts"
			content: "application/json": schema: unityschemas.Accounts
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
