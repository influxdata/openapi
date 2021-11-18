package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

tasks_taskID_runs_runID_logs: get: {
	operationId: "GetTasksIDRunsIDLogs"
	tags: [
		"Tasks",
	]
	summary: "Retrieve all logs for a run"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "taskID"
		schema: type: "string"
		required:    true
		description: "ID of task to get logs for."
	}, {
		in:   "path"
		name: "runID"
		schema: type: "string"
		required:    true
		description: "ID of run to get logs for."
	}]
	responses: {
		"200": {
			description: "All logs for a run"
			content: "application/json": schema: commonschemas.Logs.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
