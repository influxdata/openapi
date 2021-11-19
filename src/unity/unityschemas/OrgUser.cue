package unityschemas

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
		role: Role.#Ref
	}
	required: ["id", "firstName", "lastName", "email", "role"]
}
