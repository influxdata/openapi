package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

orgs_orgID: {
	get: {
		operationId: "GetOrgsID"
		tags: [
			"Organizations",
		]
		summary: "Retrieve an organization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization to get."
		}]
		responses: {
			"200": {
				description: "Organization details"
				content: "application/json": schema: commonschemas.Organization.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchOrgsID"
		tags: [
			"Organizations",
		]
		summary: "Update an organization"
		requestBody: {
			description: "Organization update to apply"
			required:    true
			content: "application/json": schema: commonschemas.PatchOrganizationRequest.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization to get."
		}]
		responses: {
			"200": {
				description: "Organization updated"
				content: "application/json": schema: commonschemas.Organization.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteOrgsID"
		tags: [
			"Organizations",
		]
		summary: "Delete an organization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization to delete."
		}]
		responses: {
			"204": description: "Delete has been accepted"
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
}
