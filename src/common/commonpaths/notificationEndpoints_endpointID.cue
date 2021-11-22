package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

notificationEndpoints_endpointID: {
	get: {
		operationId: "GetNotificationEndpointsID"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Retrieve a notification endpoint"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "endpointID"
			schema: type: "string"
			required:    true
			description: "The notification endpoint ID."
		}]
		responses: {
			"200": {
				description: "The notification endpoint requested"
				content: "application/json": schema: commonschemas.NotificationEndpoint.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	put: {
		operationId: "PutNotificationEndpointsID"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Update a notification endpoint"
		requestBody: {
			description: "A new notification endpoint to replace the existing endpoint with"
			required:    true
			content: "application/json": schema: commonschemas.NotificationEndpoint.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "endpointID"
			schema: type: "string"
			required:    true
			description: "The notification endpoint ID."
		}]
		responses: {
			"200": {
				description: "An updated notification endpoint"
				content: "application/json": schema: commonschemas.NotificationEndpoint.#Ref
			}
			"404": {
				description: "The notification endpoint was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchNotificationEndpointsID"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Update a notification endpoint"
		requestBody: {
			description: "Check update to apply"
			required:    true
			content: "application/json": schema: commonschemas.NotificationEndpointUpdate.#Ref
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "endpointID"
			schema: type: "string"
			required:    true
			description: "The notification endpoint ID."
		}]
		responses: {
			"200": {
				description: "An updated notification endpoint"
				content: "application/json": schema: commonschemas.NotificationEndpoint.#Ref
			}
			"404": {
				description: "The notification endpoint was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteNotificationEndpointsID"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Delete a notification endpoint"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "endpointID"
			schema: type: "string"
			required:    true
			description: "The notification endpoint ID."
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"404": {
				description: "The endpoint was not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
