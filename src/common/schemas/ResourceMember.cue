package schemas

ResourceMember: allOf: [{
	$ref: "./UserResponse.yml"
}, {
	type: "object"
	properties: role: {
		type:    "string"
		default: "member"
		enum: ["member"]
	}
}]
