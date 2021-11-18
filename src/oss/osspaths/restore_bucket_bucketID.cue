package osspaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

restore_bucket_bucketID: post: {
	operationId: "PostRestoreBucketID"
	tags: [
		"Restore",
	]
	summary:    "Overwrite storage metadata for a bucket with shard info from a backup."
	deprecated: true
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "bucketID"
		schema: type: "string"
		required:    true
		description: "The bucket ID."
	}, {
		in:   "header"
		name: "Content-Type"
		schema: {
			type:    "string"
			default: "application/octet-stream"
			enum: [
				"application/octet-stream",
			]
		}
	}]
	requestBody: {
		description: "Database info serialized as protobuf."
		required:    true
		content: {
			// NOTE: Use text-plain here to work around https://github.com/influxdata/oats/issues/16.
			"text/plain": {
				schema: {
					type:   "string"
					format: "byte"
				}
			}
		}
	}
	responses: {
		"200": {
			description: "ID mappings for shards in bucket."
			content: "application/json": schema: {
				// Actually an object mapping uint64 -> uint64,
				// can't find a good way to represent that in OpenAPI.
				type:   "string"
				format: "byte"
			}
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
