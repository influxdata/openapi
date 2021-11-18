package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

notificationRules: {
	get: {
		operationId: "GetNotificationRules"
		tags: [
			"NotificationRules",
		]
		summary: "List all notification rules"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			commonparameters.Offset.#Ref
		}, {
			commonparameters.Limit.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			required:    true
			description: "Only show notification rules that belong to a specific organization ID."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "checkID"
			description: "Only show notifications that belong to the specific check ID."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "tag"
			description: "Only return notification rules that \"would match\" statuses which contain the tag key value pairs provided."
			schema: {
				type:    "string"
				pattern: "^[a-zA-Z0-9_]+:[a-zA-Z0-9_]+$"
				example: "env:prod"
			}
		}]
		responses: {
			"200": {
				description: "A list of notification rules"
				content: "application/json": schema: commonschemas.NotificationRules.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "CreateNotificationRule"
		tags: [
			"NotificationRules",
		]
		summary: "Add a notification rule"
		requestBody: {
			description: "Notification rule to create"
			required:    true
			content: "application/json": schema: commonschemas.PostNotificationRule.#Ref
		}
		responses: {
			"201": {
				description: "Notification rule created"
				content: "application/json": schema: commonschemas.NotificationRule.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
