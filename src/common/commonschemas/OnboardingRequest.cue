package commonschemas

OnboardingRequest: {
	type: "object"
	properties: {
		username: type: "string"
		password: type: "string"
		org: type: "string"
		bucket: type: "string"
		retentionPeriodSeconds: {
			type:   "integer"
			format: "int64"
		}
		retentionPeriodHrs: {
			type:       "integer"
			deprecated: true
			description: """
				Retention period *in nanoseconds* for the new bucket. This key's name has been misleading since OSS 2.0 GA, please transition to use `retentionPeriodSeconds`

				"""
		}

		token: {
			type: "string"
			description: """
				Authentication token to set on the initial user. If not specified, the server will generate a token.

				"""
		}
	}

	required: [
		"username",
		"org",
		"bucket",
	]
}
