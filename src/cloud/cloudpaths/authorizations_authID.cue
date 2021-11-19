package cloudpaths

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/cloud/cloudschemas"

authorizations_authID: {
	get: {
		operationId: "GetAuthorizationsID"
		tags: [
			"Authorizations",
		]
		summary: "Retrieve an authorization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "authID"
			schema: type: "string"
			required:    true
			description: "The identifier of the authorization to get."
		}]
		responses: {
			"200": {
				description: "Authorization details"
				content: "application/json": schema: cloudschemas.Authorization.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchAuthorizationsID"
		tags: [
			"Authorizations",
		]
		summary:     "Update authorization status"
		description: "Update an authorization's status to `active` or `inactive`."
		requestBody: {
			description: "The updated Authorization object."
			required:    true
			content: "application/json": schema: commonschemas.AuthorizationUpdateRequest.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "authID"
			schema: type: "string"
			required:    true
			description: "The identifier of the authorization to update."
		}]
		responses: {
			"200": {
				description: "The updated authorization."
				content: "application/json": schema: cloudschemas.Authorization.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteAuthorizationsID"
		tags: [
			"Authorizations",
		]
		summary: "Delete an authorization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "authID"
			schema: type: "string"
			required:    true
			description: "The identifier of the authorization to delete."
		}]
		responses: {
			"204": description: "Authorization deleted"
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
