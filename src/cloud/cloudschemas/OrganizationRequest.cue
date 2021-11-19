package cloudschemas

OrganizationRequest: {
	type: "object"
	properties: {
		username: {
			type:        "string"
			description: "username of the Quartz user to be added in IDPE"
			example:     "user@email.com"
		}
		org: {
			type:        "string"
			description: "the name of the organization to be added"
		}
		limit: Limit.#Ref
		retentionSeconds: {
			type:        "integer"
			description: "length of time to retain data in seconds"
		}
		bucket: {
			type:        "string"
			description: "the name of the bucket to be created"
		}
	}
}
