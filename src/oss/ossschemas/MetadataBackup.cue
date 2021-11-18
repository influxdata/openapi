package ossschemas

MetadataBackup: {
	type: "object"
	properties: {
		kv: {
			type:   "string"
			format: "binary"
		}
		sql: {
			type:   "string"
			format: "binary"
		}
		buckets: $ref: "./BucketMetadataManifests.yml"
	}
	required: ["kv", "sql", "buckets"]
}
