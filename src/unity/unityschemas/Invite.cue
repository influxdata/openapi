package unityschemas

Invite: {
	properties: {
		id: {
			description: "the quartz id of the invite"
			readOnly:    true
			type:        "number"
		}
		email: type: "string"
		role: Role.#Ref
		expiresAt: {
			description: "when the invite will expire"
			readOnly:    true
			format:      "date-time"
			type:        "string"
		}
	}
	required: ["email", "role"]
}
