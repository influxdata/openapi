package annotationdschemas

AnnotationDeleteFilter: {
	type: "object"
	required: [
		"stream",
		"startTime",
		"endTime",
	]
	properties: {
		stickers: {
			type: "object"
			additionalProperties: type: "string"
		}
		stream: type:   "string"
		streamID: type: "string"
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
