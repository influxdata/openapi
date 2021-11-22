package unitypaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonparameters"
)
orgs_orgId_users_userId: delete: {
	operationId: "DeleteOrgsIdUserId"
	tags: [
		"Users",
		"Organizations",
	]
	summary: "Removes a user from an organization and account"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userId"
		schema: type: "string"
		required:    true
		description: "The ID of the user to remove."
	}, {
		in:   "path"
		name: "orgId"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	responses: {
		"204": description: "User removed"
		"400": {
			description: "User trying to remove self"
			commonresponses.ServerError.#Ref
		}
		"401": {
			description: "Unauthorized"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Session user not owner or User/Org not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
