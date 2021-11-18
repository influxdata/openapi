package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

telegrafs_telegrafID_members_userID: delete: {
	operationId: "DeleteTelegrafsIDMembersID"
	tags: [
		"Telegrafs",
	]
	summary: "Remove a member from a Telegraf config"
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
		name: "telegrafID"
		schema: type: "string"
		required:    true
		description: "The Telegraf config ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
