package common

import "github.com/influxdata/openapi/src/common/commonschemas"

#DefaultError: default: {
	description: "Unexpected error"
	content: "application/json": schema: commonschemas.Error.#Ref
}
