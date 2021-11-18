package commonpaths

dashboards_dashboardID_labels_labelID: delete: {
	operationId: "DeleteDashboardsIDLabelsID"
	tags: [
		"Dashboards",
	]
	summary: "Delete a label from a dashboard"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "dashboardID"
		schema: type: "string"
		required:    true
		description: "The dashboard ID."
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
			description: "Dashboard not found"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
