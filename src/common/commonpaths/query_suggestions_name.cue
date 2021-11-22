package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

query_suggestions_name: get: {
	operationId: "GetQuerySuggestionsName"
	tags: [
		"Query",
	]
	summary: "Retrieve query suggestions for a branching suggestion"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "name"
		schema: type: "string"
		required:    true
		description: "The name of the branching suggestion."
	}]
	responses: {
		"200": {
			description: "Suggestions for next functions in call chain"
			content: "application/json": schema: commonschemas.FluxSuggestion.#Ref
		}
		default: {
			description: "Any response other than 200 is an internal server error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
