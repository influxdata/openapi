package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

dashboards_dashboardID: {
	get: {
		operationId: "GetDashboardsID"
		tags: [
			"Dashboards",
		]
		summary: "Retrieve a Dashboard"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The ID of the dashboard to update."
		}, {
			in:       "query"
			name:     "include"
			required: false
			schema: {
				type: "string"
				enum: [
					"properties",
				]
			}
			description: "Includes the cell view properties in the response if set to `properties`"
		}]
		responses: {
			"200": {
				description: "Retrieve a single dashboard"
				content: "application/json": schema: oneOf: [{
					commonschemas.Dashboard.#Ref
				}, {
					commonschemas.DashboardWithViewProperties.#Ref
				}]
			}
			"404": {
				description: "Dashboard not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchDashboardsID"
		tags: [
			"Dashboards",
		]
		summary: "Update a dashboard"
		requestBody: {
			description: "Patching of a dashboard"
			required:    true
			content: "application/json": schema: {
				type:  "object"
				title: "PatchDashboardRequest"
				properties: {
					name: {
						description: "optional, when provided will replace the name"
						type:        "string"
					}
					description: {
						description: "optional, when provided will replace the description"
						type:        "string"
					}
					cells: {
						description: "optional, when provided will replace all existing cells with the cells provided"
						commonschemas.CellWithViewProperties.#Ref
					}
				}
			}
		}
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The ID of the dashboard to update."
		}]
		responses: {
			"200": {
				description: "Updated dashboard"
				content: "application/json": schema: commonschemas.Dashboard.#Ref
			}
			"404": {
				description: "Dashboard not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteDashboardsID"
		tags: [
			"Dashboards",
		]
		summary: "Delete a dashboard"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "dashboardID"
			schema: type: "string"
			required:    true
			description: "The ID of the dashboard to update."
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"404": {
				description: "Dashboard not found"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
