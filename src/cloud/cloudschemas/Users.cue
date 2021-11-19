package cloudschemas

Users: {
	type: "object"
	properties: {
		links: {
			type: "object"
			properties: self: {
				type:   "string"
				format: "uri"
			}
		}
		users: {
			type: "array"
			items: $ref: "../../common/schemas/UserResponse.yml"
		}
	}
}
