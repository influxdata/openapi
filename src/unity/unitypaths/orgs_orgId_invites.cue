package unitypaths

import (
	"github.com/influxdata/openapi/src/unity/unityschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/common/commonparameters"
)
orgs_orgId_invites: {
	get: {
		operationId: "GetInvites"
		tags: [
			"Invites",
		]
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "path"
			name:        "orgId"
			description: "Specifies the organization ID of the Invite."
			required:    true
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of cloud invites"
				content: "application/json": schema: unityschemas.Invites.#Ref
			}
			"401": {
				description: "Unauthorized"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Session user not owner or Org not found"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
		}
	}
	post: {
		operationId: "PostOrgsIdInvites"
		tags: [
			"Invites",
			"Organizations",
		]
		summary: "Creates an invite to an organization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgId"
			schema: type: "string"
			required:    true
			description: "The organization ID."
		}]
		requestBody: {
			description: "Invite to be sent"
			required:    true
			content: "application/json": schema: unityschemas.Invite.#Ref
		}
		responses: {
			"201": {
				description: "Invite sent"
				content: "application/json": schema: unityschemas.Invite.#Ref
			}
			"401": {
				description: "Unauthorized"
				commonresponses.ServerError.#Ref
			}
			"404": {
				description: "Session user not owner or Org not found"
				commonresponses.ServerError.#Ref
			}
			"409": {
				description: "Conflict with invite email"
				commonresponses.ServerError.#Ref
			}
			"422": {
				description: "Missing information"
				commonresponses.ServerError.#Ref
			}
			default: {
				description: "Unexpected error"
				commonresponses.ServerError.#Ref
			}
			"429": {
				description: "Too many requests"
				commonresponses.ServerError.#Ref
			}
		}
	}
}
