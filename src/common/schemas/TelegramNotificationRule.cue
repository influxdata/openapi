package schemas

TelegramNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./TelegramNotificationRuleBase.yml"
}]
