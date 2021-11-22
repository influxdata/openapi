package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

notificationEndpoints_endpointID_labels: {
	get: {
		operationId: "GetNotificationEndpointsIDLabels"
		tags: [
			"NotificationEndpoints",
		]
		summary: "List all labels for a notification endpoint"
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
				description: "A list of all labels for a notification endpoint"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostNotificationEndpointIDLabels"
		tags: [
			"NotificationEndpoints",
		]
		summary: "Add a label to a notification endpoint"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "endpointID"
			schema: type: "string"
			required:    true
			description: "The notification endpoint ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The label was added to the notification endpoint"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
