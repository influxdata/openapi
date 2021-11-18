package paths

dashboards_dashboardID_members_userID: delete: {
	operationId: "DeleteDashboardsIDMembersID"
	tags: [
		"Dashboards",
	]
	summary: "Remove a member from a dashboard"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the member to remove."
	}, {
		in:   "path"
		name: "dashboardID"
		schema: type: "string"
		required:    true
		description: "The dashboard ID."
	}]
	responses: {
		"204": description: "Member removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
