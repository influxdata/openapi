package commonschemas

DBRPGet: {
	type: "object"
	properties: content: {
		DBRP.#Ref

		// TODO this is wrong.
		required: true
	}
}
