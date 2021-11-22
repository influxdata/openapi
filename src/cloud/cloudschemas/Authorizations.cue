package cloudschemas

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

)

Authorizations: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			commonschemas.Links.#Ref
		}
		authorizations: {
			type:  "array"
			items: Authorization.#Ref
		}
	}
}
