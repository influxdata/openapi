package commonresponses

import "github.com/influxdata/openapi/src/common/commonschemas"

ResourceNotFoundError: {
	// This represents the body of a 404 error from the server.
	description: "Not found. A requested resource was not found. The response body contains the requested resource type, e.g. `organization name` or `bucket`, and name."
	content: "application/json": {
		schema: commonschemas.Error.#Ref
		examples: "resource-not-found": {
			summary: "Not found error"
			value: {
				code:    "not found"
				message: "bucket \"air_sensor\" not found"
			}
		}
	}
}
