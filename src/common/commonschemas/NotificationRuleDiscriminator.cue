package commonschemas

NotificationRuleDiscriminator: {
	oneOf: [{
		SlackNotificationRule.#Ref
	}, {
		SMTPNotificationRule.#Ref
	}, {
		PagerDutyNotificationRule.#Ref
	}, {
		HTTPNotificationRule.#Ref
	}, {
		TelegramNotificationRule.#Ref
	}]
	discriminator: {
		propertyName: "type"
		mapping: {
			slack:     "#/components/schemas/SlackNotificationRule"
			smtp:      "#/components/schemas/SMTPNotificationRule"
			pagerduty: "#/components/schemas/PagerDutyNotificationRule"
			http:      "#/components/schemas/HTTPNotificationRule"
			telegram:  "#/components/schemas/TelegramNotificationRule"
		}
	}
}
