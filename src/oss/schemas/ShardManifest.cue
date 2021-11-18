package schemas

ShardManifest: {
	type: "object"
	properties: {
		id: {
			type:   "integer"
			format: "int64"
		}
		shardOwners: $ref: "./ShardOwners.yml"
	}
	required: ["id", "shardOwners"]
}
