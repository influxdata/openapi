package commonpaths

tasks_taskID_runs_runID: {
	get: {
		operationId: "GetTasksIDRunsID"
		tags: [
			"Tasks",
		]
		summary: "Retrieve a single run for a task"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
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
				description: "The run record"
				content: "application/json": schema: $ref: "../schemas/Run.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteTasksIDRunsID"
		tags: [
			"Tasks",
		]
		summary: "Cancel a running task"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
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
			"204": description: "Delete has been accepted"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
