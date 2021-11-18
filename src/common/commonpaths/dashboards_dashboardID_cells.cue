package commonpaths

dashboards_dashboardID_cells: {
	put: {
		operationId: "PutDashboardsIDCells"
		tags: [
			"Cells",
			"Dashboards",
		]
		summary:     "Replace cells in a dashboard"
		description: "Replaces all cells in a dashboard. This is used primarily to update the positional information of all cells."
		requestBody: {
			required: true
			content: "application/json": schema: $ref: "../schemas/Cells.yml"
		}
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The ID of the dashboard to update."
		}]
		responses: {
			"201": {
				description: "Replaced dashboard cells"
				content: "application/json": schema: $ref: "../schemas/Dashboard.yml"
			}
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
	post: {
		operationId: "PostDashboardsIDCells"
		tags: [
			"Cells",
			"Dashboards",
		]
		summary: "Create a dashboard cell"
		requestBody: {
			description: "Cell that will be added"
			required:    true
			content: "application/json": schema: $ref: "../schemas/CreateCell.yml"
		}
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The ID of the dashboard to update."
		}]
		responses: {
			"201": {
				description: "Cell successfully added"
				content: "application/json": schema: $ref: "../schemas/Cell.yml"
			}
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
}
