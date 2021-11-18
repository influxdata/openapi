package commonschemas

DurationLiteral: {
	description: "Represents the elapsed time between two instants as an int64 nanosecond count with syntax of golang's time.Duration"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		values: {
			description: "Duration values"
			type:        "array"
			items: Duration.#Ref
		}
	}
}
