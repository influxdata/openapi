package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

dashboards_dashboardID_members: {
	get: {
		operationId: "GetDashboardsIDMembers"
		tags: [
			"Dashboards",
		]
		summary: "List all dashboard members"
		parameters: [{
			commonparameters.TraceSpan.#Ref
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
				content: "application/json": schema: commonschemas.ResourceMembers.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
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
			commonparameters.TraceSpan.#Ref
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
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Added to dashboard members"
				content: "application/json": schema: commonschemas.ResourceMember.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
