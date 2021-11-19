package annotationdschemas

ReadStream: {
	type: "object"
	properties: {
		id: type:          "string"
		stream: type:      "string"
		description: type: "string"
		createdAt: {
			type:   "string"
			format: "date-time"
		}
		updatedAt: {
			type:   "string"
			format: "date-time"
		}
	}
}
