package commonpaths

notificationEndpoints_endpointID_labels_labelID: delete: {
	operationId: "DeleteNotificationEndpointsIDLabelsID"
	tags: [
		"NotificationEndpoints",
	]
	summary: "Delete a label from a notification endpoint"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
