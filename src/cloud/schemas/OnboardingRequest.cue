package schemas

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
		limit: $ref:                  "./Limit.yml"
	}
	required: [
		"username",
		"org",
		"bucket",
	]
}
