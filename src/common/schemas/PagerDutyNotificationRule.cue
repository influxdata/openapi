package schemas

PagerDutyNotificationRule: allOf: [{
	$ref: "./NotificationRuleBase.yml"
}, {
	$ref: "./PagerDutyNotificationRuleBase.yml"
}]
