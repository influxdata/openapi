package quartzpaths

import (
	"github.com/influxdata/openapi/src/quartz/quartzschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

orgs: {
	get: {
		operationId: "GetOrgs"
		tags: [
			"Organizations",
		]
		summary: "List all organizations"
		responses: {
			"200": {
				description: "A list of organizations"
				content: "application/json": schema: quartzschemas.Organizations.#Ref
			}
			"401": {
				description: "Unauthorized bearer token"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	post: {
		operationId: "PostOrgs"
		tags: [
			"Organizations",
		]
		summary: "Creates an organization"
		requestBody: {
			description: "Information for provisioning an organization"
			required:    true
			content: "application/json": schema: quartzschemas.OrganizationRequest.#Ref
		}
		responses: {
			"201": {
				description: "Organization created"
				content: "application/json": schema: quartzschemas.OrganizationWithToken.#Ref
			}
			"400": {
				description: "Invalid request"
				commonresponses.ServerError.#Ref
			}
			"401": {
				description: "Unauthorized bearer token"
				commonresponses.ServerError.#Ref
			}
			"409": {
				description: "Organization name taken"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
