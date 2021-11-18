package commonschemas

DateTimeLiteral: {
	description: "Represents an instant in time with nanosecond precision using the syntax of golang's RFC3339 Nanosecond variant"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		value: {
			type:   "string"
			format: "date-time"
		}
	}
}
