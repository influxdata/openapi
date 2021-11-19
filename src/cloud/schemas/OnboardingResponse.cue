package schemas

OnboardingResponse: {
	type: "object"
	properties: {
		user: $ref:   "../../common/schemas/UserResponse.yml"
		org: $ref:    "../../common/schemas/Organization.yml"
		bucket: $ref: "../../common/schemas/Bucket.yml"
		auth: $ref:   "./Authorization.yml"
	}
}
