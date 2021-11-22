package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"
	"github.com/influxdata/openapi/src/cloud/cloudschemas"
)

experimental_sampledata_buckets: get: {
	operationId: "GetDemoDataBuckets"
	tags: [
		"DemoDataBuckets",
	]
	summary: "List of Demo Data Buckets"
	responses: {
		"200": {
			description: "A list of demo data buckets"
			content: "application/json": schema: cloudschemas.DemoDataBuckets.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
