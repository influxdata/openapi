package schemas

PatchBucketRequest: {
	type:        "object"
	description: "Updates to an existing bucket resource."
	properties: {
		name: type: "string"
		description: type: "string"
		retentionRules: $ref: "./PatchRetentionRules.yml"
	}
}
