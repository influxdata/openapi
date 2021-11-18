package commonschemas

OnboardingResponse: {
	type: "object"
	properties: {
		user: $ref: "./UserResponse.yml"
		org: $ref: "./Organization.yml"
		bucket: $ref: "./Bucket.yml"
		auth: $ref: "./Authorization.yml"
	}
}
