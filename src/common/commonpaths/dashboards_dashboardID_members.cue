package commonpaths

dashboards_dashboardID_members: {
	get: {
		operationId: "GetDashboardsIDMembers"
		tags: [
			"Dashboards",
		]
		summary: "List all dashboard members"
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
				description: "A list of users who have member privileges for a dashboard"
				content: "application/json": schema: $ref: "../schemas/ResourceMembers.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostDashboardsIDMembers"
		tags: [
			"Dashboards",
		]
		summary: "Add a member to a dashboard"
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
			description: "User to add as member"
			required:    true
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Added to dashboard members"
				content: "application/json": schema: $ref: "../schemas/ResourceMember.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
