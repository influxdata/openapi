package annotationdschemas

Annotation: {
	type: "object"
	properties: {
		summary: type: "string"
		message: type: "string"
		stickers: {
			type: "object"
			additionalProperties: type: "string"
		}
		startTime: {
			type:   "string"
			format: "date-time"
		}
		endTime: {
			type:   "string"
			format: "date-time"
		}
	}
}
