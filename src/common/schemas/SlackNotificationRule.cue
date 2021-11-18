package schemas

SlackNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./SlackNotificationRuleBase.yml"
}]
