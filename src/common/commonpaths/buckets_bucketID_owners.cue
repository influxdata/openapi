package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

buckets_bucketID_owners: {
	get: {
		operationId: "GetBucketsIDOwners"
		tags: [
			"Buckets",
		]
		summary: "List all owners of a bucket"
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
				description: "A list of bucket owners"
				content: "application/json": schema: commonschemas.ResourceOwners.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostBucketsIDOwners"
		tags: [
			"Buckets",
		]
		summary: "Add an owner to a bucket"
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
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: commonschemas.AddResourceMemberRequestBody.#Ref
		}
		responses: {
			"201": {
				description: "Bucket owner added"
				content: "application/json": schema: commonschemas.ResourceOwner.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
