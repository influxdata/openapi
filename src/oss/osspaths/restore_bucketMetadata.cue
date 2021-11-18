package osspaths

restore_bucketMetadata: post: {
	operationId: "PostRestoreBucketMetadata"
	tags: [
		"Restore",
	]
	summary: "Create a new bucket pre-seeded with shard info from a backup."
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}]
	requestBody: {
		description: "Metadata manifest for a bucket."
		required:    true
		content: "application/json": schema: $ref: "../schemas/BucketMetadataManifest.yml"
	}
	responses: {
		"201": {
			description: "ID mappings for shards in new bucket."
			content: "application/json": schema: $ref: "../schemas/RestoredBucketMappings.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
