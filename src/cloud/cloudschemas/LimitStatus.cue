package cloudschemas

LimitStatus: {
	type: "object"
	properties: status: {
		type: "string"
		enum: [
			"ok",
			"exceeded",
		]
	}
	required: ["status"]
}
