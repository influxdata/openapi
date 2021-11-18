package schemas

OrgUser: {
	properties: {
		id: {
			description: "the idpe id of the user"
			readOnly:    true
			type:        "string"
		}
		firstName: type: "string"
		lastName: type: "string"
		email: type: "string"
		role: $ref: "./Role.yml"
	}
	required: ["id", "firstName", "lastName", "email", "role"]
}
