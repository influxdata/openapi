package commonschemas

HTTPNotificationRule: allOf: [{
	NotificationRuleBase.#Ref
}, {
	HTTPNotificationRuleBase.#Ref
}]
