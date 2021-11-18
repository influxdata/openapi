package commonschemas

SlackNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./SlackNotificationRuleBase.yml"
}]
