package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

notificationEndpoints: {
	get: {
		operationId: "GetNotificationEndpoints"
		tags: [
			"NotificationEndpoints",
		]
		summary: "List all notification endpoints"
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
			description: "Only show notification endpoints that belong to specific organization ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of notification endpoints"
				content: "application/json": schema: commonschemas.NotificationEndpoints.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "CreateNotificationEndpoint"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Add a notification endpoint"
		requestBody: {
			description: "Notification endpoint to create"
			required:    true
			content: "application/json": schema: commonschemas.PostNotificationEndpoint.#Ref
		}
		responses: {
			"201": {
				description: "Notification endpoint created"
				content: "application/json": schema: commonschemas.NotificationEndpoint.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
