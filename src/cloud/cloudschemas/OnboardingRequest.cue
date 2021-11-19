package cloudschemas

OnboardingRequest: {
	type: "object"
	properties: {
		username: type: "string"
		password: type: "string"
		org: type:      "string"
		bucket: type:   "string"
		retentionPeriodHrs: {
			type:       "integer"
			deprecated: true
		}
		retentionPeriodSeconds: type: "integer"
		limit: Limit.#Ref
	}
	required: [
		"username",
		"org",
		"bucket",
	]
}
