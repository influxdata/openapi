package commonpaths

notificationRules: {
	get: {
		operationId: "GetNotificationRules"
		tags: [
			"NotificationRules",
		]
		summary: "List all notification rules"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			$ref: "../parameters/Offset.yml"
		}, {
			$ref: "../parameters/Limit.yml"
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
				content: "application/json": schema: $ref: "../schemas/NotificationRules.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
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
			content: "application/json": schema: $ref: "../schemas/PostNotificationRule.yml"
		}
		responses: {
			"201": {
				description: "Notification rule created"
				content: "application/json": schema: $ref: "../schemas/NotificationRule.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
