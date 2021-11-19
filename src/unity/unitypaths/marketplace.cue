package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

marketplace: get: {
	operationId: "GetMarketplace"
	tags: [
		"Marketplace",
	]
	responses: {
		"200": {
			description: "Marketplace information for account"
			content: "application/json": schema: unityschemas.Marketplace.#Ref
		}
		"401": {
			description: "Not Authorized or Invalid Session"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Marketplace not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
