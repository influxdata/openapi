package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

tasks_taskID_owners_userID: delete: {
	operationId: "DeleteTasksIDOwnersID"
	tags: [
		"Tasks",
	]
	summary: "Remove an owner from a task"
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
		name: "taskID"
		schema: type: "string"
		required:    true
		description: "The task ID."
	}]
	responses: {
		"204": description: "Owner removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
