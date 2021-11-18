package schemas

BucketMetadataManifest: {
	type: "object"
	properties: {
		// 2.x metadata / API fields
		organizationID: {
			type: "string"
		}
		organizationName: type: "string"
		bucketID: type: "string"
		bucketName: type: "string"
		description: type: "string"

		// 1.x / storage-engine fields
		defaultRetentionPolicy: {
			type: "string"
		}
		retentionPolicies: $ref: "./RetentionPolicyManifests.yml"
	}
	required: [
		"organizationID",
		"organizationName",
		"bucketID",
		"bucketName",
		"defaultRetentionPolicy",
		"retentionPolicies",
	]
}
