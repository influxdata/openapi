package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

dashboards_dashboardID_owners_userID: delete: {
	operationId: "DeleteDashboardsIDOwnersID"
	tags: [
		"Dashboards",
	]
	summary: "Remove an owner from a dashboard"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the owner to remove."
	}, {
		in:   "path"
		name: "dashboardID"
		schema: type: "string"
		required:    true
		description: "The dashboard ID."
	}]
	responses: {
		"204": description: "Owner removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
