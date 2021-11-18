package common

import "github.com/influxdata/openapi/src/common/schemas"

#DefaultError: default: {
	description: "Unexpected error"
	content: "application/json": schema: schemas.Error.#Ref
}
