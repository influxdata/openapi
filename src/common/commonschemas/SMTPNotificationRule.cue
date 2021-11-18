package commonschemas

SMTPNotificationRule: allOf: [{
	NotificationRuleBase.#Ref
}, {
	SMTPNotificationRuleBase.#Ref
}]
