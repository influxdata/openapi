package quartzschemas

CheckLimits: {
	description: "Check limits"
	type:        "object"
	properties: maxChecks: {
		description: "Number of checks allowed"
		example:     2
		oneOf: [{
			RestrictedLimit.#Ref
		}, {
			Unlimited.#Ref
		}, {
			Limit.#Ref
		}]
	}
}
