package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

operator_accounts_accountId: {
	// Oats is making this incredibly annoying with naming conflicts
	get: {
		operationId: "GetAccountById"
		tags: [
			"Accounts",
			"Operators",
		]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "accountId"
			schema: type: "string"
			required:    true
			description: "The ID of the account to get."
		}]
		responses: {
			"200": {
				description: "the account"
				content: "application/json": schema: allOf: [{
					unityschemas.OperatorAccount.#Ref
				}, {
					properties: organizations: {
						type:        "array"
						description: "organizations in the account"
						unityschemas.Organizations.#Ref
					}
				}, {
					required: ["organizations"]
				}]
			}
			"401": {
				description: "Unauthorized"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Account not found"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteAccountById"
		requestBody: content: "application/json; charset=utf-8": schema: type: "object"
		tags: [
			"Accounts",
			"Operators",
		]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "accountId"
			schema: type: "string"
			required:    true
			description: "The ID of the account to delete."
		}]
		responses: {
			"204": description: "Account deleted"
			"400": {
				description: "Account is not deletable"
				commonresponses.ServerError.#Ref
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
}
