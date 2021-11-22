package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

telegrafs_telegrafID_owners: {
	get: {
		operationId: "GetTelegrafsIDOwners"
		tags: [
			"Telegrafs",
		]
		summary: "List all owners of a Telegraf configuration"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf configuration ID."
		}]
		responses: {
			"200": {
				description: "Returns Telegraf configuration owners as a ResourceOwners list"
				content: "application/json": schema: commonschemas.ResourceOwners.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostTelegrafsIDOwners"
		tags: [
			"Telegrafs",
		]
		summary: "Add an owner to a Telegraf configuration"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf configuration ID."
		}]
		requestBody: {
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Telegraf configuration owner was added. Returns a ResourceOwner that references the User."
				content: "application/json": schema: commonschemas.ResourceOwner.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
