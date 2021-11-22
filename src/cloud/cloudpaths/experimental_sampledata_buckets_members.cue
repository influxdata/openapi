package cloudpaths

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

)

experimental_sampledata_buckets_members: {
	post: {
		operationId: "GetDemoDataBucketMembers"
		tags: [
			"DemoDataBuckets",
		]
		summary: "List of Demo Data Buckets"
		parameters: [{
			in:       "path"
			name:     "bucketID"
			required: true
			schema: type: "string"
			description: "bucket id"
		}]
		responses: {
			"204": description: "A list of demo data buckets"
			"200": description: "if sampledata route is not available gateway responds with 200"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteDemoDataBucketMembers"
		tags: [
			"DemoDataBuckets",
		]
		summary: "List of Demo Data Buckets"
		parameters: [{
			in:       "path"
			name:     "bucketID"
			required: true
			schema: type: "string"
			description: "bucket id"
		}]
		responses: {
			"204": description: "A list of demo data buckets"
			"200": description: "if sampledata route is not available gateway responds with 200"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
