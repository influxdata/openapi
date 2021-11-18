package commonschemas

SlackNotificationRule: allOf: [{
	NotificationRuleBase.#Ref
}, {
	SlackNotificationRuleBase.#Ref
}]
