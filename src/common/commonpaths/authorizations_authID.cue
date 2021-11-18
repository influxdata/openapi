package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

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
			description: "The ID of the authorization to get."
		}]
		responses: {
			"200": {
				description: "Authorization details"
				content: "application/json": schema: commonschemas.Authorization.#Ref
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	patch: {
		operationId: "PatchAuthorizationsID"
		tags: [
			"Authorizations",
		]
		summary: "Update an authorization to be active or inactive"
		requestBody: {
			description: "Authorization to update"
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
			description: "The ID of the authorization to update."
		}]
		responses: {
			"200": {
				description: "The active or inactive authorization"
				content: "application/json": schema: commonschemas.Authorization.#Ref
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
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
			description: "The ID of the authorization to delete."
		}]
		responses: {
			"204": description: "Authorization deleted"
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
