package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"

	"github.com/influxdata/openapi/src/common/commonresponses"

	"github.com/influxdata/openapi/src/common/commonparameters"

)
orgs_orgId_users: get: {
	operationId: "GetUsers"
	tags: [
		"Users",
	]
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:          "path"
		name:        "orgId"
		description: "Specifies the organization ID of the User."
		required:    true
		schema: type: "string"
	}]
	responses: {
		"200": {
			description: "A list of users"
			content: "application/json": schema: unityschemas.OrgUsers.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Org or Users not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
