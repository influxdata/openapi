package paths

tasks_taskID_runs_runID_logs: get: {
	operationId: "GetTasksIDRunsIDLogs"
	tags: [
		"Tasks",
	]
	summary: "Retrieve all logs for a run"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/Logs.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
