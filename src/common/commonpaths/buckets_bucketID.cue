package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

buckets_bucketID: {
	get: {
		operationId: "GetBucketsID"
		tags: [
			"Buckets",
		]
		summary: "Retrieve a bucket"
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
				description: "Bucket details"
				content: "application/json": schema: commonschemas.Bucket.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchBucketsID"
		tags: [
			"Buckets",
		]
		summary: "Update a bucket"
		requestBody: {
			description: "Bucket update to apply"
			required:    true
			content: "application/json": schema: commonschemas.PatchBucketRequest.#Ref
		}
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
				description: "An updated bucket"
				content: "application/json": schema: commonschemas.Bucket.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	delete: {
		operationId: "DeleteBucketsID"
		tags: [
			"Buckets",
		]
		summary: "Delete a bucket"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "bucketID"
			schema: type: "string"
			required:    true
			description: "The ID of the bucket to delete."
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
}
