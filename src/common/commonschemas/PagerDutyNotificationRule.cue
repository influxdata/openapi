package commonschemas

PagerDutyNotificationRule: allOf: [{
	NotificationRuleBase.#Ref
}, {
	PagerDutyNotificationRuleBase.#Ref
}]
