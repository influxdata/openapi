package ossschemas

ReplicationCreationRequest: {
	type: "object"
	properties: {
		name: type:           "string"
		description: type:    "string"
		orgID: type:          "string"
		remoteID: type:       "string"
		localBucketID: type:  "string"
		remoteBucketID: type: "string"
		maxQueueSizeBytes: {
			type:    "integer"
			format:  "int64"
			minimum: 33554430 // 32 MiB
			default: 67108860
		} // 64 MiB
		dropNonRetryableData: {
			type:    "boolean"
			default: false
		}
	}
	required: [
		"name",
		"orgID",
		"remoteID",
		"localBucketID",
		"remoteBucketID",
		"maxQueueSizeBytes",
	]
}
