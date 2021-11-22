package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

dashboards_dashboardID_labels: {
	get: {
		operationId: "GetDashboardsIDLabels"
		tags: [
			"Dashboards",
		]
		summary: "List all labels for a dashboard"
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
				description: "A list of all labels for a dashboard"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
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
			commonparameters.TraceSpan.#Ref
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
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The label added to the dashboard"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
