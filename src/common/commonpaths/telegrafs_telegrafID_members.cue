package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

telegrafs_telegrafID_members: {
	get: {
		operationId: "GetTelegrafsIDMembers"
		tags: [
			"Telegrafs",
		]
		summary: "List all users with member privileges for a Telegraf config"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		responses: {
			"200": {
				description: "A list of Telegraf config members"
				content: "application/json": schema: commonschemas.ResourceMembers.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTelegrafsIDMembers"
		tags: [
			"Telegrafs",
		]
		summary: "Add a member to a Telegraf config"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		requestBody: {
			description: "User to add as member"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Member added to Telegraf config"
				content: "application/json": schema: commonschemas.ResourceMember.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
