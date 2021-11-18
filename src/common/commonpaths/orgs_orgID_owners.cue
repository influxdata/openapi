package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

orgs_orgID_owners: {
	get: {
		operationId: "GetOrgsIDOwners"
		tags: [
			"Organizations",
		]
		summary: "List all owners of an organization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The organization ID."
		}]
		responses: {
			"200": {
				description: "A list of organization owners"
				content: "application/json": schema: commonschemas.ResourceOwners.#Ref
			}
			"404": {
				description: "Organization not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostOrgsIDOwners"
		tags: [
			"Organizations",
		]
		summary: "Add an owner to an organization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The organization ID."
		}]
		requestBody: {
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Organization owner added"
				content: "application/json": schema: commonschemas.ResourceOwner.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
