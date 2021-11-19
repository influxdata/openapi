package cloudpaths

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonparameters"

dashboards: {
	post: {
		operationId: "PostDashboards"
		tags: [
			"Dashboards",
		]
		summary: "Create a dashboard"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Dashboard to create"
			required:    true
			content: "application/json": schema: commonschemas.CreateDashboardRequest.#Ref
		}
		responses: {
			"201": {
				description: "Added dashboard"
				content: "application/json": schema: oneOf: [{
					commonschemas.Dashboard.#Ref
				}, {
					commonschemas.DashboardWithViewProperties.#Ref
				}]
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	get: {
		operationId: "GetDashboards"
		tags: [
			"Dashboards",
		]
		summary: "List all dashboards"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			commonparameters.Offset.#Ref
		}, {
			commonparameters.Descending.#Ref
		}, {
			in:   "query"
			name: "limit"
			schema: {
				type:    "integer"
				minimum: -1
				maximum: 100
				default: 20
			}
			description: "The non-zero number of dashboards to return"
		}, {
			in:          "query"
			name:        "owner"
			description: "A user identifier. Returns only dashboards where this user has the `owner` role."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "sortBy"
			description: "The column to sort by."
			schema: {
				type: "string"
				enum: [
					"ID",
					"CreatedAt",
					"UpdatedAt",
				]
			}
		}, {
			in:          "query"
			name:        "id"
			description: "A list of dashboard identifiers. Returns only the listed dashboards. If both `id` and `owner` are specified, only `id` is used."
			schema: {
				type: "array"
				items: type: "string"
			}
		}, {
			in:          "query"
			name:        "orgID"
			description: "The identifier of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "All dashboards"
				content: "application/json": schema: commonschemas.Dashboards.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
