package quartzpaths

import "github.com/influxdata/openapi/src/quartz/quartzschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

org: {
	get: {
		operationId: "GetOrgsID"
		tags: [
			"Organizations",
		]
		summary: "Retrieve a single organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "The found organization"
				content: "application/json": schema: quartzschemas.Organization.#Ref
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
	delete: {
		operationId: "DeleteOrgsID"
		tags: [
			"Organizations",
		]
		summary: "Delete a single organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"204": {
				description: "The organization was deleted"
				content: "application/json": schema: quartzschemas.Organization.#Ref
			}
			"401": {
				description: "Unauthorized bearer token"
				commonresponses.ServerError.#Ref
			}
			"503": {
				description: "Service Unavailable"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
