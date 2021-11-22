package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

notificationEndpoints_endpointID_labels_labelID: delete: {
	operationId: "DeleteNotificationEndpointsIDLabelsID"
	tags: [
		"NotificationEndpoints",
	]
	summary: "Delete a label from a notification endpoint"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "endpointID"
		schema: type: "string"
		required:    true
		description: "The notification endpoint ID."
	}, {
		in:   "path"
		name: "labelID"
		schema: type: "string"
		required:    true
		description: "The ID of the label to delete."
	}]
	responses: {
		"204": description: "Delete has been accepted"
		"404": {
			description: "Endpoint or label not found"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
