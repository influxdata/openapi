package commonschemas

TelegramNotificationRule: allOf: [{
	NotificationRuleBase.#Ref
}, {
	TelegramNotificationRuleBase.#Ref
}]
