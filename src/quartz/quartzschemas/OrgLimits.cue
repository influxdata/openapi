package quartzschemas

OrgLimits: {
	type: "object"
	properties: {
		orgID: {
			type:        "string"
			readOnly:    true
			description: "ID of the org for which these rates apply"
		}
		rate: $ref:                 "./RateLimits.yml"
		bucket: $ref:               "./BucketLimits.yml"
		task: $ref:                 "./TaskLimits.yml"
		dashboard: $ref:            "./DashboardLimits.yml"
		check: $ref:                "./CheckLimits.yml"
		notificationRule: $ref:     "./NotificationRuleLimits.yml"
		notificationEndpoint: $ref: "./NotificationEndpointLimits.yml"
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
