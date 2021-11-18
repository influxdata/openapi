package schemas

SMTPNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./SMTPNotificationRuleBase.yml"
}]
