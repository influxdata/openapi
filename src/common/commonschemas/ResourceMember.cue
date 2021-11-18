package commonschemas

ResourceMember: allOf: [{
	UserResponse.#Ref
}, {
	type: "object"
	properties: role: {
		type:    "string"
		default: "member"
		enum: ["member"]
	}
}]
