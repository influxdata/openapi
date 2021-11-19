package cloudschemas

LimitEvent: {
	type: "object"
	properties: {
		orgID: type: "string"
		type: {
			type: "string"
			enum: [
				"limited_quota",
				"limited_write",
				"limited_query",
				"limited_cardinality",
			]
		}
		timestamp: {
			readOnly: true
			type:     "string"
			format:   "date-time"
		}
	}
}
