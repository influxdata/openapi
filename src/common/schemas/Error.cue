package schemas

Error: {
	properties: {
		code: $ref: "./ErrorCode.yml"
		message: {
			readOnly:    true
			description: "message is a human-readable message."
			type:        "string"
		}
		op: {
			readOnly:    true
			description: "op describes the logical code operation during error. Useful for debugging."
			type:        "string"
		}
		err: {
			readOnly:    true
			description: "err is a stack of errors that occurred during processing of the request. Useful for debugging."
			type:        "string"
		}
	}
	required: ["code", "message"]
}
