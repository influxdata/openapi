package ossschemas

ReplicationUpdateRequest: {
	type: "object"
	properties: {
		name: type: "string"
		description: type: "string"
		remoteID: type: "string"
		remoteBucketID: type: "string"
		maxQueueSizeBytes: {
			type:    "integer"
			format:  "int64"
			minimum: 33554430
		} // 32 MiB
		dropNonRetryableData: {
			type: "boolean"
		}
	}
}
