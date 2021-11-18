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
		buckets: BucketMetadataManifests.#Ref
	}
	required: ["kv", "sql", "buckets"]
}
