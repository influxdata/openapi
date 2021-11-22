package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/cloud/cloudschemas"
)

users: {
	get: {
		operationId: "GetUsers"
		tags: [
			"Users",
		]
		summary: "List all users"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		responses: {
			"200": {
				description: "A list of users"
				content: "application/json": schema: cloudschemas.Users.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
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
			content: "application/json": schema: cloudschemas.User.#Ref
		}
		responses: {
			"201": {
				description: "User created"
				content: "application/json": schema: commonschemas.UserResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
