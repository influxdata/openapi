package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

orgs_orgID_members_userID: delete: {
	operationId: "DeleteOrgsIDMembersID"
	tags: [
		"Organizations",
	]
	summary: "Remove a member from an organization"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the member to remove."
	}, {
		in:   "path"
		name: "orgID"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
