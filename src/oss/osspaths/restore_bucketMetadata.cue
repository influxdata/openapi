package osspaths

import (
	"github.com/influxdata/openapi/src/oss/ossschemas"
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

restore_bucketMetadata: post: {
	operationId: "PostRestoreBucketMetadata"
	tags: [
		"Restore",
	]
	summary: "Create a new bucket pre-seeded with shard info from a backup."
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	requestBody: {
		description: "Metadata manifest for a bucket."
		required:    true
		content: "application/json": schema: ossschemas.BucketMetadataManifest.#Ref
	}
	responses: {
		"201": {
			description: "ID mappings for shards in new bucket."
			content: "application/json": schema: ossschemas.RestoredBucketMappings.#Ref
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
