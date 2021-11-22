package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

orgs: {
	get: {
		operationId: "GetOrgs"
		tags: [
			"Organizations",
		]
		summary: "List all organizations"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			commonparameters.Offset.#Ref
		}, {
			commonparameters.Limit.#Ref
		}, {
			commonparameters.Descending.#Ref
		}, {
			in:   "query"
			name: "org"
			schema: type: "string"
			description: "Filter organizations to a specific organization name."
		}, {
			in:   "query"
			name: "orgID"
			schema: type: "string"
			description: "Filter organizations to a specific organization ID."
		}, {
			in:   "query"
			name: "userID"
			schema: type: "string"
			description: "Filter organizations to a specific user ID."
		}]
		responses: {
			"200": {
				description: "A list of organizations"
				content: "application/json": schema: commonschemas.Organizations.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostOrgs"
		tags: [
			"Organizations",
		]
		summary: "Create an organization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Organization to create"
			required:    true
			content: "application/json": schema: commonschemas.PostOrganizationRequest.#Ref
		}
		responses: {
			"201": {
				description: "Organization created"
				content: "application/json": schema: commonschemas.Organization.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
