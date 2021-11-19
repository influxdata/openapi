package quartzschemas

DashboardLimits: {
	description: "Dashboard limits"
	type:        "object"
	properties: maxDashboards: {
		description: "Number of dashboards allowed"
		example:     5
		oneOf: [{
			RestrictedLimit.#Ref
		}, {
			Unlimited.#Ref
		}, {
			Limit.#Ref
		}]
	}
}
