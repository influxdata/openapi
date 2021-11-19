package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

operator_accounts: get: {
	operationId: "GetAccountsForOperator"
	tags: [
		"Accounts",
		"Operators",
	]
	summary: "Get the list of accounts by search term"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "query"
		name: "query"
		schema: type: "string"
		required:    false
		description: "The partial email of any user in an account"
	}]
	responses: {
		"200": {
			description: "Account"
			content: "application/json": schema: unityschemas.OperatorAccounts.#Ref
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
