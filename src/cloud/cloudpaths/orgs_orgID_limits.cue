package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/cloud/cloudschemas"
)

orgs_orgID_limits: {
	get: {
		tags: [
			"Limits",
		]
		summary: "Retrieve limits for an organization"
		parameters: [{
			in:          "path"
			name:        "orgID"
			description: "The identifier of the organization."
			required:    true
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A limit"
				content: "application/json": schema: cloudschemas.Limit.#Ref
			}
			default: {
				description: "unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	put: {
		tags: [
			"Limits",
		]
		summary: "Create or update limits for an organization"
		parameters: [{
			in:          "path"
			name:        "orgID"
			description: "The identifier of the organization."
			required:    true
			schema: type: "string"
		}]
		requestBody: {
			description: "limit that will be updated"
			required:    true
			content: "application/json": schema: cloudschemas.Limit.#Ref
		}
		responses: {
			"200": {
				description: "The updated or created limit"
				content: "application/json": schema: cloudschemas.Limit.#Ref
			}
			default: {
				description: "unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
