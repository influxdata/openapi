package osspaths

import "github.com/influxdata/openapi/src/common/commonresponses"

legacy_authorizations: {
	get: {
		operationId: "GetLegacyAuthorizations"
		tags: [
			"Legacy Authorizations",
		]
		summary: "List all legacy authorizations"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "query"
			name: "userID"
			schema: type: "string"
			description: "Only show legacy authorizations that belong to a user ID."
		}, {
			in:   "query"
			name: "user"
			schema: type: "string"
			description: "Only show legacy authorizations that belong to a user name."
		}, {
			in:   "query"
			name: "orgID"
			schema: type: "string"
			description: "Only show legacy authorizations that belong to an organization ID."
		}, {
			in:   "query"
			name: "org"
			schema: type: "string"
			description: "Only show legacy authorizations that belong to a organization name."
		}, {
			in:   "query"
			name: "token"
			schema: type: "string"
			description: "Only show legacy authorizations with a specified token (auth name)."
		}, {
			in:   "query"
			name: "authID"
			schema: type: "string"
			description: "Only show legacy authorizations with a specified auth ID."
		}]
		responses: {
			"200": {
				description: "A list of legacy authorizations"
				content: "application/json": schema: $ref: "../../common/schemas/Authorizations.yml"
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	post: {
		operationId: "PostLegacyAuthorizations"
		tags: [
			"Legacy Authorizations",
		]
		summary: "Create a legacy authorization"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "Legacy authorization to create"
			required:    true
			content: "application/json": schema: $ref: "../../oss/schemas/LegacyAuthorizationPostRequest.yml"
		}
		responses: {
			"201": {
				description: "Legacy authorization created"
				content: "application/json": schema: $ref: "../../common/schemas/Authorization.yml"
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
