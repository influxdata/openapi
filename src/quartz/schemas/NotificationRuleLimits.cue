package schemas

NotificationRuleLimits: {
	description: "Notification rule limits"
	type:        "object"
	properties: {
		maxNotifications: {
			description: "Number of notifications allowed"
			example:     2
			oneOf: [{
				$ref: "./RestrictedLimit.yml"
			}, {
				$ref: "./Unlimited.yml"
			}, {
				$ref: "./Limit.yml"
			}]
		}
		blockedNotificationRules: {
			description: "Notification rules not allowed CSV"
			example:     "http,pagerduty"
			type:        "string"
		}
	}
}
