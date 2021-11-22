package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

tasks_taskID_owners: {
	get: {
		operationId: "GetTasksIDOwners"
		tags: [
			"Tasks",
		]
		summary: "List all owners of a task"
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
				description: "A list of users who have owner privileges for a task"
				content: "application/json": schema: commonschemas.ResourceOwners.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTasksIDOwners"
		tags: [
			"Tasks",
		]
		summary: "Add an owner to a task"
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
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Added to task owners"
				content: "application/json": schema: commonschemas.ResourceOwner.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
