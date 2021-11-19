package quartzschemas

NotificationRuleLimits: {
	description: "Notification rule limits"
	type:        "object"
	properties: {
		maxNotifications: {
			description: "Number of notifications allowed"
			example:     2
			oneOf: [{
				RestrictedLimit.#Ref
			}, {
				Unlimited.#Ref
			}, {
				Limit.#Ref
			}]
		}
		blockedNotificationRules: {
			description: "Notification rules not allowed CSV"
			example:     "http,pagerduty"
			type:        "string"
		}
	}
}
