package ossschemas

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
		retentionPolicies: RetentionPolicyManifests.#Ref
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
