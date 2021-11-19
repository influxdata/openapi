package quartzschemas

BucketLimits: {
	description: "Bucket limits"
	type:        "object"
	properties: {
		maxBuckets: {
			example:     2
			description: "Number of buckets allowed"
			oneOf: [{
				RestrictedLimit.#Ref
			}, {
				Unlimited.#Ref
			}, {
				Limit.#Ref
			}]
		}
		maxRetentionDuration: {
			description: "Retention duration limits in nanoseconds"
			example:     2592000000000000
			oneOf: [{
				RestrictedLimit.#Ref
			}, {
				Unlimited.#Ref
			}, {
				Limit.#Ref
			}]
		}
	}
}
