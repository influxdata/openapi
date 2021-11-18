package schemas

PostBucketRequest: {
	properties: {
		orgID: type: "string"
		name: type: "string"
		description: type: "string"
		rp: type: "string"
		retentionRules: $ref: "./RetentionRules.yml"
		schemaType: {
			$ref:    "./SchemaType.yml"
			default: "implicit"
		}
	}
	required: ["orgID", "name", "retentionRules"]
}
