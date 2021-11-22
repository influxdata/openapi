package commonresponses

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

)

InternalServerError: {
	// This represents the body of a 500 error.
	description: "Internal server error."
	content: "application/json": {
		schema: commonschemas.Error.#Ref
		examples: internalError: {
			summary: "Internal error example"
			value: code: "internal error"
		}
	}
}
