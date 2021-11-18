package commonschemas

DBRPGet: {
	type: "object"
	properties: content: {
		DBRP.#Ref
		required: true
	}
}
