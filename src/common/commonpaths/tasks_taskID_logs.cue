package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

tasks_taskID_logs: get: {
	operationId: "GetTasksIDLogs"
	tags: [
		"Tasks",
	]
	summary: "Retrieve all logs for a task"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "taskID"
		schema: type: "string"
		required:    true
		description: "The task ID."
	}]
	responses: {
		"200": {
			description: "All logs for a task"
			content: "application/json": schema: commonschemas.Logs.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
