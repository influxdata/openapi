package commonpaths

tasks_taskID_logs: get: {
	operationId: "GetTasksIDLogs"
	tags: [
		"Tasks",
	]
	summary: "Retrieve all logs for a task"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/Logs.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
