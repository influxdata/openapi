package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

tasks_taskID_runs_runID_retry: post: {
	operationId: "PostTasksIDRunsIDRetry"
	tags: [
		"Tasks",
	]
	summary: "Retry a task run"
	requestBody: content: "application/json; charset=utf-8": schema: type: "object"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "taskID"
		schema: type: "string"
		required:    true
		description: "The task ID."
	}, {
		in:   "path"
		name: "runID"
		schema: type: "string"
		required:    true
		description: "The run ID."
	}]
	responses: {
		"200": {
			description: "Run that has been queued"
			content: "application/json": schema: commonschemas.Run.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
