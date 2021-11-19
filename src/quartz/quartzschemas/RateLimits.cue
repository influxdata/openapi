package quartzschemas

RateLimits: {
	description: "Usage rate limits"
	type:        "object"
	properties: {
		readKBs: {
			description: "KB of data query'd per second"
			example:     1000
			oneOf: [{
				RestrictedLimit.#Ref
			}, {
				Limit.#Ref
				maximum: 10000
			}]
		}
		writeKBs: {
			description: "KB of data written per second"
			example:     17
			oneOf: [{
				RestrictedLimit.#Ref
			}, {
				Limit.#Ref
				maximum: 10000
			}]
		}
		cardinality: {
			description: "Max cardinality of data"
			example:     10000
			oneOf: [{
				RestrictedLimit.#Ref
			}, {
				Limit.#Ref
				maximum: 1000000
			}]
		}
	}
}
