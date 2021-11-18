package ossschemas

ShardManifest: {
	type: "object"
	properties: {
		id: {
			type:   "integer"
			format: "int64"
		}
		shardOwners: ShardOwners.#Ref
	}
	required: ["id", "shardOwners"]
}
