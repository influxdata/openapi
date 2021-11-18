package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

buckets_bucketID_labels: {
	get: {
		operationId: "GetBucketsIDLabels"
		tags: [
			"Buckets",
		]
		summary: "List all labels for a bucket"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The bucket ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a bucket"
				content: "application/json": schema: commonschemas.LabelsResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostBucketsIDLabels"
		tags: [
			"Buckets",
		]
		summary: "Add a label to a bucket"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The bucket ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: commonschemas.LabelMapping.#Ref
		}
		responses: {
			"201": {
				description: "The newly added label"
				content: "application/json": schema: commonschemas.LabelResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
