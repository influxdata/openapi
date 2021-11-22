package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

resources: get: {
	operationId: "GetResources"
	tags: [
		"Resources",
	]
	summary: "List all known resources"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"200": {
			description: "All resources targets"
			content: "application/json": schema: commonschemas.Resources
		}
		default: {
			description: "Internal server error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
