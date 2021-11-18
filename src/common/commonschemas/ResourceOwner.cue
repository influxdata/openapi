package commonschemas

ResourceOwner: allOf: [{
	UserResponse.#Ref
}, {
	type: "object"
	properties: role: {
		type:    "string"
		default: "owner"
		enum: ["owner"]
	}
}]
