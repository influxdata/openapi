package unitypaths

import "github.com/influxdata/openapi/src/unity/unityschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

orgs_orgId_invites_inviteId_resend: post: {
	operationId: "PostOrgsIdInvitesId"
	tags: [
		"Invites",
		"Organizations",
	]
	summary: "Re-sends an invite"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "inviteId"
		schema: type: "number"
		required:    true
		description: "The ID of the invite to resend."
	}, {
		in:   "path"
		name: "orgId"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	responses: {
		"200": {
			description: "Invite resent"
			content: "application/json": schema: unityschemas.Invite.#Ref
		}
		"401": {
			description: "Not Authorized or Invalid Session"
			commonresponses.ServerError.#Ref
		}
		"404": {
			description: "Session user not owner or Invite/Org not found"
			commonresponses.ServerError.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
