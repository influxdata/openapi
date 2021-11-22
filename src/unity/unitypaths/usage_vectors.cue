package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)
usage_vectors: get: {
	operationId: "GetUsageVectors"
	tags: [
		"Usage",
	]
	responses: {
		"200": {
			description: "List of usage vectors for the account"
			content: "application/json": schema: unityschemas.UsageVectors.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Pricing version not 4 or User/Org not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
