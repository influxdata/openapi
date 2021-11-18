package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

users: {
	get: {
		operationId: "GetUsers"
		tags: [
			"Users",
		]
		summary: "List all users"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			commonparameters.Offset.#Ref
		}, {
			commonparameters.Limit.#Ref
		}, {
			commonparameters.After.#Ref
		}, {
			in:   "query"
			name: "name"
			schema: type: "string"
		}, {
			in:   "query"
			name: "id"
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of users"
				content: "application/json": schema: commonschemas.Users.#Ref
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	post: {
		operationId: "PostUsers"
		tags: [
			"Users",
		]
		summary: "Create a user"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "User to create"
			required:    true
			content: "application/json": schema: commonschemas.User.#Ref
		}
		responses: {
			"201": {
				description: "User created"
				content: "application/json": schema: commonschemas.UserResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
