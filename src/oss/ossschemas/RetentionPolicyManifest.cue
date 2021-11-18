package ossschemas

RetentionPolicyManifest: {
	type: "object"
	properties: {
		name: type: "string"
		replicaN: type: "integer"
		duration: {
			type:   "integer"
			format: "int64"
		}
		shardGroupDuration: {
			type:   "integer"
			format: "int64"
		}
		shardGroups: ShardGroupManifests.#Ref
		subscriptions: SubscriptionManifests.#Ref
	}
	required: ["name", "replicaN", "duration", "shardGroupDuration", "shardGroups", "subscriptions"]
}
