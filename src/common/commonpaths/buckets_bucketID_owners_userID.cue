package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

buckets_bucketID_owners_userID: delete: {
	operationId: "DeleteBucketsIDOwnersID"
	tags: [
		"Buckets",
	]
	summary: "Remove an owner from a bucket"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "userID"
		schema: type: "string"
		required:    true
		description: "The ID of the owner to remove."
	}, {
		in:   "path"
		name: "bucketID"
		schema: type: "string"
		required:    true
		description: "The bucket ID."
	}]
	responses: {
		"204": description: "Owner removed"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
