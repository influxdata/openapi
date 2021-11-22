package cloudschemas

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

)

DemoDataBuckets: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			commonschemas.Links.#Ref
		}
		buckets: {
			type:  "array"
			items: DemoDataBucket.#Ref
		}
	}
}
