package commonschemas

PostBucketRequest: {
	properties: {
		orgID: type:       "string"
		name: type:        "string"
		description: type: "string"
		rp: type:          "string"
		retentionRules: RetentionRules.#Ref
		schemaType: {
			SchemaType.#Ref
			default: "implicit"
		}
	}
	required: ["orgID", "name", "retentionRules"]
}
