package ossschemas

ShardGroupManifest: {
	type: "object"
	properties: {
		id: {
			type:   "integer"
			format: "int64"
		}
		startTime: {
			type:   "string"
			format: "date-time"
		}
		endTime: {
			type:   "string"
			format: "date-time"
		}
		deletedAt: {
			type:   "string"
			format: "date-time"
		}
		truncatedAt: {
			type:   "string"
			format: "date-time"
		}
		shards: $ref: "./ShardManifests.yml"
	}
	required: ["id", "startTime", "endTime", "shards"]
}
