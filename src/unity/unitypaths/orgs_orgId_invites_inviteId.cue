package unitypaths

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"

orgs_orgId_invites_inviteId: delete: {
	operationId: "DeleteOrgsIdInviteId"
	tags: [
		"Invites",
		"Organizations",
	]
	summary: "Remove an invite to an organization"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "inviteId"
		schema: type: "number"
		required:    true
		description: "The ID of the invite to remove."
	}, {
		in:   "path"
		name: "orgId"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	responses: {
		"204": description: "Invite removed"
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
