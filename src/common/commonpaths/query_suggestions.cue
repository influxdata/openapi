package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

query_suggestions: get: {
	operationId: "GetQuerySuggestions"
	tags: [
		"Query",
	]
	summary: "Retrieve query suggestions"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"200": {
			description: "Suggestions for next functions in call chain"
			content: "application/json": schema: commonschemas.FluxSuggestions.#Ref
		}
		default: {
			description: "Any response other than 200 is an internal server error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
