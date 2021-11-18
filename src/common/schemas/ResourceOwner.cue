package schemas

ResourceOwner: allOf: [{
	$ref: "./UserResponse.yml"
}, {
	type: "object"
	properties: role: {
		type:    "string"
		default: "owner"
		enum: ["owner"]
	}
}]
