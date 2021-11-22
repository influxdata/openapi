package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

tasks_taskID_runs: {
	get: {
		operationId: "GetTasksIDRuns"
		tags: [
			"Tasks",
		]
		summary: "List runs for a task"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required:    true
			description: "The ID of the task to get runs for."
		}, {
			in:   "query"
			name: "after"
			schema: type: "string"
			description: "Returns runs after a specific ID."
		}, {
			in:   "query"
			name: "limit"
			schema: {
				type:    "integer"
				minimum: 1
				maximum: 500
				default: 100
			}
			description: "The number of runs to return"
		}, {
			in:   "query"
			name: "afterTime"
			schema: {
				type:   "string"
				format: "date-time"
			}
			description: "Filter runs to those scheduled after this time, RFC3339"
		}, {
			in:   "query"
			name: "beforeTime"
			schema: {
				type:   "string"
				format: "date-time"
			}
			description: "Filter runs to those scheduled before this time, RFC3339"
		}]
		responses: {
			"200": {
				description: "A list of task runs"
				content: "application/json": schema: commonschemas.Runs.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTasksIDRuns"
		tags: [
			"Tasks",
		]
		summary: "Manually start a task run, overriding the current schedule"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "taskID"
			schema: type: "string"
			required: true
		}]
		requestBody: content: "application/json": schema: commonschemas.RunManually.#Ref
		responses: {
			"201": {
				description: "Run scheduled to start"
				content: "application/json": schema: commonschemas.Run.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
