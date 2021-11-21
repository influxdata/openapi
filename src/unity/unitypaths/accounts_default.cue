package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

accounts_default: put: {
	operationId: "PutDefaultAccount"
	tags: [
		"Accounts",
	]
	requestBody: {
		description: "The account to set as the user's default account"
		required:    true
		content: "application/json": schema: unityschemas.AccountsDefaultRequest
	}
	responses: {
		"204": description: "default account set"
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
