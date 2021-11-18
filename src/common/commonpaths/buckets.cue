package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

buckets: {
	get: {
		operationId: "GetBuckets"
		tags: [
			"Buckets",
		]
		summary: "List all buckets"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			commonparameters.Offset.#Ref
		}, {
			commonparameters.Limit.#Ref
		}, {
			commonparameters.After.#Ref
		}, {
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "name"
			description: "Only returns buckets with a specific name."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "id"
			description: "Only returns buckets with a specific ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of buckets"
				content: "application/json": schema: commonschemas.Buckets.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "PostBuckets"
		tags: [
			"Buckets",
		]
		summary: "Create a bucket"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}]
		requestBody: {
			description: "Bucket to create"
			required:    true
			content: "application/json": schema: commonschemas.PostBucketRequest.#Ref
		}
		responses: {
			"201": {
				description: "Bucket created"
				content: "application/json": schema: commonschemas.Bucket.#Ref
			}
			"422": {
				description: "Request body failed validation"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
