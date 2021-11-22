package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

tasks: {
	get: {
		operationId: "GetTasks"
		tags: [
			"Tasks",
		]
		summary: "List all tasks"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "name"
			description: "Returns task with a specific name."
			schema: type: "string"
		}, {
			in:   "query"
			name: "after"
			schema: type: "string"
			description: "Return tasks after a specified ID."
		}, {
			in:   "query"
			name: "user"
			schema: type: "string"
			description: "Filter tasks to a specific user ID."
		}, {
			in:   "query"
			name: "org"
			schema: type: "string"
			description: "Filter tasks to a specific organization name."
		}, {
			in:   "query"
			name: "orgID"
			schema: type: "string"
			description: "Filter tasks to a specific organization ID."
		}, {
			in:   "query"
			name: "status"
			schema: {
				type: "string"
				enum: [
					"active",
					"inactive",
				]
			}
			description: "Filter tasks by a status--\"inactive\" or \"active\"."
		}, {
			in:   "query"
			name: "limit"
			schema: {
				type:    "integer"
				minimum: 1
				maximum: 500
				default: 100
			}
			description: "The number of tasks to return"
		}, {
			in:          "query"
			name:        "type"
			description: "Type of task, unset by default."
			required:    false
			schema: {
				default: ""
				type:    "string"
				enum: [
					"basic",
					"system",
				]
			}
		}]
		responses: {
			"200": {
				description: "A list of tasks"
				content: "application/json": schema: commonschemas.Tasks.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTasks"
		tags: [
			"Tasks",
		]
		summary: "Create a new task"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Task to create"
			required:    true
			content: "application/json": schema: commonschemas.TaskCreateRequest.#Ref
		}
		responses: {
			"201": {
				description: "Task created"
				content: "application/json": schema: commonschemas.Task.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
