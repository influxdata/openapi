package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

tasks_taskID_runs_runID: {
	get: {
		operationId: "GetTasksIDRunsID"
		tags: [
			"Tasks",
		]
		summary: "Retrieve a single run for a task"
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
				description: "The run record"
				content: "application/json": schema: commonschemas.Run.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
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
			"204": description: "Delete has been accepted"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
