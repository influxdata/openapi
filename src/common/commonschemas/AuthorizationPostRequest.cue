package commonschemas

AuthorizationPostRequest: {
	required: ["orgID", "permissions"]
	allOf: [{
		$ref: "./AuthorizationUpdateRequest.yml"
	}, {
		type: "object"
		properties: {
			orgID: {
				type:        "string"
				description: "ID of org that authorization is scoped to."
			}
			userID: {
				type:        "string"
				description: "ID of user that authorization is scoped to."
			}
			permissions: {
				type:        "array"
				minItems:    1
				description: "List of permissions for an auth.  An auth must have at least one Permission."
				items: $ref: "./Permission.yml"
			}
		}
	}]
}
