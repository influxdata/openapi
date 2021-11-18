package schemas

BasicFilter: {
	type: "object"
	properties: {
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
