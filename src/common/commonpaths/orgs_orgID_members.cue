package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

orgs_orgID_members: {
	get: {
		operationId: "GetOrgsIDMembers"
		tags: [
			"Organizations",
		]
		summary: "List all members of an organization"
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
				description: "A list of organization members"
				content: "application/json": schema: commonschemas.ResourceMembers.#Ref
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
		operationId: "PostOrgsIDMembers"
		tags: [
			"Organizations",
		]
		summary: "Add a member to an organization"
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
			description: "User to add as member"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Added to organization created"
				content: "application/json": schema: commonschemas.ResourceMember.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
