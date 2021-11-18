package commonschemas

PatchBucketRequest: {
	type:        "object"
	description: "Updates to an existing bucket resource."
	properties: {
		name: type: "string"
		description: type: "string"
		retentionRules: PatchRetentionRules.#Ref
	}
}
