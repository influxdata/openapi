package schemas

ForbiddenRequestError: properties: {
	code: {
		description: "returns error code 403"
		readOnly:    true
		type:        "string"
		enum: [
			"forbidden",
		]
	}
	message: {
		readOnly:    true
		description: "message is a human-readable message."
		type:        "string"
	}
}
