package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

tasks_taskID_members: {
	get: {
		operationId: "GetTasksIDMembers"
		tags: [
			"Tasks",
		]
		summary: "List all task members"
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
				description: "A list of users who have member privileges for a task"
				content: "application/json": schema: commonschemas.ResourceMembers.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTasksIDMembers"
		tags: [
			"Tasks",
		]
		summary: "Add a member to a task"
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
			description: "User to add as member"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Added to task members"
				content: "application/json": schema: commonschemas.ResourceMember.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
