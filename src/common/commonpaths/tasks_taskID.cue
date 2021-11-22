package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

tasks_taskID: {
	get: {
		operationId: "GetTasksID"
		tags: [
			"Tasks",
		]
		summary: "Retrieve a task"
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
				description: "Task details"
				content: "application/json": schema: commonschemas.Task.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchTasksID"
		tags: [
			"Tasks",
		]
		summary:     "Update a task"
		description: "Update a task. This will cancel all queued runs."
		requestBody: {
			description: "Task update to apply"
			required:    true
			content: "application/json": schema: commonschemas.TaskUpdateRequest.#Ref
		}
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
				description: "Task updated"
				content: "application/json": schema: commonschemas.Task.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteTasksID"
		tags: [
			"Tasks",
		]
		summary:     "Delete a task"
		description: "Deletes a task and all associated records"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required:    true
			description: "The ID of the task to delete."
		}]
		responses: {
			"204": description: "Task deleted"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
