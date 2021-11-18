package ossschemas

RestoredBucketMappings: {
	type: "object"
	properties: {
		id: {
			description: "New ID of the restored bucket"
			type:        "string"
		}
		name: type: "string"
		shardMappings: $ref: "./BucketShardMappings.yml"
	}
	required: ["id", "name", "shardMappings"]
}
