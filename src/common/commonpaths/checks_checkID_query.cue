package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

checks_checkID_query: get: {
	operationId: "GetChecksIDQuery"
	tags: [
		"Checks",
	]
	summary: "Retrieve a check query"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "checkID"
		schema: type: "string"
		required:    true
		description: "The check ID."
	}]
	responses: {
		"200": {
			description: "The check query requested"
			content: "application/json": schema: commonschemas.FluxResponse.#Ref
		}
		"400": {
			description: "Invalid request"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		"404": {
			description: "Check not found"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
