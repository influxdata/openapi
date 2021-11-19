package cloudschemas

UnauthorizedRequestError: properties: {
	code: {
		description: "returns error code 401"
		readOnly:    true
		type:        "string"
		enum: [
			"unauthorized",
		]
	}
	message: {
		readOnly:    true
		description: "message is a human-readable message."
		type:        "string"
	}
}
