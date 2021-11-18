package schemas

RetentionRule: {
	type: "object"
	properties: {
		type: {
			type:    "string"
			default: "expire"
			enum: [
				"expire",
			]
		}
		everySeconds: {
			type:        "integer"
			format:      "int64"
			description: "Duration in seconds for how long data will be kept in the database. 0 means infinite."
			example:     86400
			minimum:     0
		}
		shardGroupDurationSeconds: {
			type:        "integer"
			format:      "int64"
			description: "Shard duration measured in seconds."
		}
	}
	required: ["type", "everySeconds"]
}
