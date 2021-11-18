package commonpaths

dashboards_dashboardID_labels: {
	get: {
		operationId: "GetDashboardsIDLabels"
		tags: [
			"Dashboards",
		]
		summary: "List all labels for a dashboard"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The dashboard ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a dashboard"
				content: "application/json": schema: $ref: "../schemas/LabelsResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostDashboardsIDLabels"
		tags: [
			"Dashboards",
		]
		summary: "Add a label to a dashboard"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The dashboard ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: $ref: "../schemas/LabelMapping.yml"
		}
		responses: {
			"201": {
				description: "The label added to the dashboard"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
