package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

dashboards_dashboardID_labels_labelID: delete: {
	operationId: "DeleteDashboardsIDLabelsID"
	tags: [
		"Dashboards",
	]
	summary: "Delete a label from a dashboard"
	parameters: [{
		commonparameters.TraceSpan.#Ref
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
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
