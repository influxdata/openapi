package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

me: get: {
	operationId: "GetMe"
	tags: [
		"Users",
	]
	summary: "Retrieve the currently authenticated user"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"200": {
			description: "The currently authenticated user."
			content: "application/json": schema: commonschemas.UserResponse.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
