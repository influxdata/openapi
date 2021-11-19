package schemas

User: {
	properties: {
		id: {
			readOnly: true
			type:     "string"
		}
		oauthID: type: "string"
		name: type:    "string"
		status: {
			description: "If inactive the user is inactive."
			default:     "active"
			type:        "string"
			enum: [
				"active",
				"inactive",
			]
		}
		role: {
			type: "string"
			enum: [
				"owner",
				"member",
			]
		}
		org_id: type: "string"
	}
	required: ["name"]
}
