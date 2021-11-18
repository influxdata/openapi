package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

tasks_taskID_labels: {
	get: {
		operationId: "GetTasksIDLabels"
		tags: [
			"Tasks",
		]
		summary: "List all labels for a task"
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
				description: "A list of all labels for a task"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTasksIDLabels"
		tags: [
			"Tasks",
		]
		summary: "Add a label to a task"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required:    true
			description: "The task ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "A list of all labels for a task"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
