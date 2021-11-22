package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonschemas"

)

buckets_bucketID_labels_labelID: delete: {
	operationId: "DeleteBucketsIDLabelsID"
	tags: [
		"Buckets",
	]
	summary: "Delete a label from a bucket"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "bucketID"
		schema: type: "string"
		required:    true
		description: "The bucket ID."
	}, {
		in:   "path"
		name: "labelID"
		schema: type: "string"
		required:    true
		description: "The ID of the label to delete."
	}]
	responses: {
		"204": description: "Delete has been accepted"
		"404": {
			description: "Bucket not found"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
