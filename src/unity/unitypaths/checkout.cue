package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

checkout: post: {
	operationId: "PostCheckout"
	tags: [
		"Accounts",
	]
	requestBody: {
		description: "Information for Upgrading Account"
		required:    true
		content: "application/json": schema: unityschemas.CheckoutRequest.#Ref
	}
	responses: {
		"201": description: "Created"
		"400": {
			description: "Bad Request"
			commonresponses.ServerError.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Org/User not found or Beta region"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
