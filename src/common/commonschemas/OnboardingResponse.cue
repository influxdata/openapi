package commonschemas

OnboardingResponse: {
	type: "object"
	properties: {
		user:   UserResponse.#Ref
		org:    Organization.#Ref
		bucket: Bucket.#Ref
		auth:   Authorization.#Ref
	}
}
