package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/cloud/cloudschemas"
)

orgs_orgID_limits_status: get: {
	tags: [
		"Limits",
	]
	summary: "Get current limit status for an org"
	parameters: [{
		in:   "path"
		name: "orgID"
		schema: type: "string"
		required:    true
		description: "The identifier of the organization."
	}]
	responses: {
		"200": {
			description: "Current limit status"
			content: "application/json": schema: cloudschemas.LimitStatuses.#Ref
		}
		default: {
			description: "unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
