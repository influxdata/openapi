package quartzschemas

OrgLimits: {
	type: "object"
	properties: {
		orgID: {
			type:        "string"
			readOnly:    true
			description: "ID of the org for which these rates apply"
		}
		rate:                 RateLimits.#Ref
		bucket:               BucketLimits.#Ref
		task:                 TaskLimits.#Ref
		dashboard:            DashboardLimits.#Ref
		check:                CheckLimits.#Ref
		notificationRule:     NotificationRuleLimits.#Ref
		notificationEndpoint: NotificationEndpointLimits.#Ref
	}
	required: [
		"orgID",
		"rate",
		"bucket",
		"task",
		"dashboard",
		"check",
		"notificationRule",
		"notificationEndpoint",
	]
}
