package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"

	"github.com/influxdata/openapi/src/cloud/cloudschemas"

)

limitevents: get: {
	tags: [
		"Limits",
	]
	summary: "List all limit events"
	parameters: [{
		in:          "query"
		name:        "orgID"
		required:    true
		description: "only show events belonging to specified organization"
		schema: type: "string"
	}, {
		in:          "query"
		name:        "start"
		description: "limit to only events at or after start time"
		schema: {
			type:   "string"
			format: "date-time"
		}
	}, {
		in:          "query"
		name:        "stop"
		description: "limit to only events before stop time"
		schema: {
			type:   "string"
			format: "date-time"
		}
	}, {
		in:   "query"
		name: "limit"
		schema: {
			type:    "integer"
			minimum: 1
			default: 100
			maximum: 100
		}
	}, {
		in:   "query"
		name: "offset"
		schema: {
			type:    "integer"
			minimum: 0
		}
	}]
	responses: {
		"200": {
			description: "A list of limit events"
			content: "application/json": schema: cloudschemas.LimitEvents.#Ref
		}
		default: {
			description: "unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
