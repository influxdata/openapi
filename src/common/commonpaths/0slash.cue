package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

"0slash": get: {
	operationId: "GetRoutes"
	summary:     "List all top level routes"
	tags: [
		"Routes",
	]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: default: {
		description: "All routes"
		content: "application/json": schema: commonschemas.Routes.#Ref
	}
}
