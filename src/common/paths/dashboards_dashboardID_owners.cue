package paths

dashboards_dashboardID_owners: {
	get: {
		operationId: "GetDashboardsIDOwners"
		tags: [
			"Dashboards",
		]
		summary: "List all dashboard owners"
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
				description: "A list of users who have owner privileges for a dashboard"
				content: "application/json": schema: $ref: "../schemas/ResourceOwners.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostDashboardsIDOwners"
		tags: [
			"Dashboards",
		]
		summary: "Add an owner to a dashboard"
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
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Added to dashboard owners"
				content: "application/json": schema: $ref: "../schemas/ResourceOwner.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
