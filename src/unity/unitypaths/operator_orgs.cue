package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

operator_orgs: get: {
	operationId: "GetOrganizations"
	tags: [
		"Organizations",
		"Operators",
	]
	summary: "Get the list of orgs by search term"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "query"
		name: "query"
		schema: type: "string"
		required:    false
		description: "The partial idpe id of the org being searched"
	}]
	responses: {
		"200": {
			description: "Organization"
			content: "application/json": schema: unityschemas.Organizations.#Ref
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
