package commonresponses

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

)

ServerError: {
	description: *"Unexpected error" | string
	content: "application/json": schema: commonschemas.Error.#Ref
}
