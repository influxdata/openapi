package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"


users_userID: {
	get: {
		operationId: "GetUsersID"
		tags: [
			"Users",
		]
		summary: "Retrieve a user"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "userID"
			schema: type: "string"
			required:    true
			description: "The user ID."
		}]
		responses: {
			"200": {
				description: "User details"
				content: "application/json": schema: commonschemas.UserResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	patch: {
		operationId: "PatchUsersID"
		tags: [
			"Users",
		]
		summary: "Update a user"
		requestBody: {
			description: "User update to apply"
			required:    true
			content: "application/json": schema: commonschemas.User.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "userID"
			schema: type: "string"
			required:    true
			description: "The ID of the user to update."
		}]
		responses: {
			"200": {
				description: "User updated"
				content: "application/json": schema: commonschemas.UserResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteUsersID"
		tags: [
			"Users",
		]
		summary: "Delete a user"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "userID"
			schema: type: "string"
			required:    true
			description: "The ID of the user to delete."
		}]
		responses: {
			"204": description: "User deleted"
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
