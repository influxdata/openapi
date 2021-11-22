package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

telegrafs_telegrafID_owners_userID: delete: {
	operationId: "DeleteTelegrafsIDOwnersID"
	tags: [
		"Telegrafs",
	]
	summary: "Remove an owner from a Telegraf config"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the owner to remove."
	}, {
		in:   "path"
		name: "telegrafID"
		schema: type: "string"
		required:    true
		description: "The Telegraf config ID."
	}]
	responses: {
		"204": description: "Owner removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
