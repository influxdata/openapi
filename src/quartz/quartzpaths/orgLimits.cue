package quartzpaths

import (
	"github.com/influxdata/openapi/src/quartz/quartzschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

orgLimits: {
	get: {
		operationId: "GetOrgsIDLimits"
		tags: [
			"Limits",
		]
		summary: "Get the limits of an organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: quartzschemas.OrgLimits.#Ref
			}
			"401": {
				description: "Unauthorized bearer token"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Organization not found"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	put: {
		operationId: "PatchOrgsIDLimits"
		tags: [
			"Limits",
		]
		summary: "Update the limits of an organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		requestBody: {
			description: "Updated limits for an organization"
			required:    true
			content: "application/json": schema: quartzschemas.OrgLimits.#Ref
		}
		responses: {
			"200": {
				description: "Organization limits"
				content: "application/json": schema: quartzschemas.OrgLimits.#Ref
			}
			"400": {
				description: "Invalid request"
				commonresponses.ServerError.#Ref
			}
			"401": {
				description: "Unauthorized bearer token"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Organization not found"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
