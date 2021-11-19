package cloudschemas

import "github.com/influxdata/openapi/src/common/commonschemas"

LimitEvents: {
	type: "object"
	properties: {
		links: commonschemas.Links.#Ref
		events: {
			type: "array"
			items: LimitEvent.#Ref
		}
	}
}
