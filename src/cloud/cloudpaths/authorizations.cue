package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/cloud/cloudschemas"
)

authorizations: {
	get: {
		operationId: "GetAuthorizations"
		tags: [
			"Authorizations",
		]
		summary: "List all authorizations"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "query"
			name: "userID"
			schema: type: "string"
			description: "Only show authorizations that belong to a user ID."
		}, {
			in:   "query"
			name: "user"
			schema: type: "string"
			description: "Only show authorizations that belong to a user name."
		}, {
			in:   "query"
			name: "orgID"
			schema: type: "string"
			description: "Only show authorizations that belong to an organization ID."
		}, {
			in:   "query"
			name: "org"
			schema: type: "string"
			description: "Only show authorizations that belong to a organization name."
		}, {
			in:   "query"
			name: "token"
			schema: type: "string"
			description: "Find a token by value."
		}]
		responses: {
			"200": {
				description: "A list of authorizations"
				content: "application/json": schema: cloudschemas.Authorizations.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	post: {
		operationId: "PostAuthorizations"
		tags: [
			"Authorizations",
		]
		summary: "Create an authorization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Authorization to create"
			required:    true
			content: "application/json": schema: cloudschemas.Authorization.#Ref
		}
		responses: {
			"201": {
				description: "Authorization created"
				content: "application/json": schema: cloudschemas.Authorization.#Ref
			}
			"400": {
				description: "Invalid request"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
