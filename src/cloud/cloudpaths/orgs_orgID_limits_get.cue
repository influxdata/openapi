package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/cloud/cloudschemas"
)

orgs_orgID_limits_get: get: {
	tags: [
		"Limits",
	]
	summary: "Retrieve limits for an organization"
	parameters: [{
		in:          "path"
		name:        "orgID"
		description: "The identifier of the organization."
		required:    true
		schema: type: "string"
	}]
	responses: {
		"200": {
			description: "The Limits defined for the organization."
			content: "application/json": schema: cloudschemas.LimitPublic
		}
		default: {
			description: "unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
