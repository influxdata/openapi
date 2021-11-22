package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

	"github.com/influxdata/openapi/src/common/commonparameters"

)
operator_orgs_orgId: get: {
	operationId: "GetOrganizationById"
	tags: [
		"Organizations",
		"Operators",
	]
	summary: "Get organization by id"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "orgId"
		schema: type: "string"
		required:    true
		description: "the idpe id of the org"
	}]
	responses: {
		"200": {
			description: "Organization"
			content: "application/json": schema: allOf: [{
				unityschemas.Organization.#Ref
			}]
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Org not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
