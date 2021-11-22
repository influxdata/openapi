package cloudschemas

import (
	"github.com/influxdata/openapi/src/common/commonschemas"
)

Users: {
	type: "object"
	properties: {
		links: {
			type: "object"
			properties: self: {
				type:   "string"
				format: "uri"
			}
		}
		users: {
			type:  "array"
			items: commonschemas.UserResponse.#Ref
		}
	}
}
