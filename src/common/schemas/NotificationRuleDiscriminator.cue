package schemas

NotificationRuleDiscriminator: {
	oneOf: [{
		$ref: "./SlackNotificationRule.yml"
	}, {
		$ref: "./SMTPNotificationRule.yml"
	}, {
		$ref: "./PagerDutyNotificationRule.yml"
	}, {
		$ref: "./HTTPNotificationRule.yml"
	}, {
		$ref: "./TelegramNotificationRule.yml"
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
