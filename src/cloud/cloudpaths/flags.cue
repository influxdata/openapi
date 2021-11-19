package cloudpaths

import "github.com/influxdata/openapi/src/common/commonschemas"

import "github.com/influxdata/openapi/src/common/commonresponses"

flags: get: {
	tags: [
		"Public Flags",
	]
	summary: "Retrieve public/preauth feature flags"
	responses: {
		"200": {
			description: "Pre-authentication exposed feature flags"
			content: "application/json": schema: commonschemas.Flags.#Ref
		}
		default: {
			description: "unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
