package commonschemas

Logs: {
	type: "object"
	properties: events: {
		readOnly: true
		type:     "array"
		items: $ref: "./LogEvent.yml"
	}
}
