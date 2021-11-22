package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

tasks_taskID_members_userID: delete: {
	operationId: "DeleteTasksIDMembersID"
	tags: [
		"Tasks",
	]
	summary: "Remove a member from a task"
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
		name: "taskID"
		schema: type: "string"
		required:    true
		description: "The task ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
