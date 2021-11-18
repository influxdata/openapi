package schemas

BucketLimits: {
	description: "Bucket limits"
	type:        "object"
	properties: {
		maxBuckets: {
			example:     2
			description: "Number of buckets allowed"
			oneOf: [{
				$ref: "./RestrictedLimit.yml"
			}, {
				$ref: "./Unlimited.yml"
			}, {
				$ref: "./Limit.yml"
			}]
		}
		maxRetentionDuration: {
			description: "Retention duration limits in nanoseconds"
			example:     2592000000000000
			oneOf: [{
				$ref: "./RestrictedLimit.yml"
			}, {
				$ref: "./Unlimited.yml"
			}, {
				$ref: "./Limit.yml"
			}]
		}
	}
}
