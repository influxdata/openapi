package schemas

NotificationEndpointDiscriminator: {
	oneOf: [{
		$ref: "./SlackNotificationEndpoint.yml"
	}, {
		$ref: "./PagerDutyNotificationEndpoint.yml"
	}, {
		$ref: "./HTTPNotificationEndpoint.yml"
	}, {
		$ref: "./TelegramNotificationEndpoint.yml"
	}]
	discriminator: {
		propertyName: "type"
		mapping: {
			slack:     "#/components/schemas/SlackNotificationEndpoint"
			pagerduty: "#/components/schemas/PagerDutyNotificationEndpoint"
			http:      "#/components/schemas/HTTPNotificationEndpoint"
			telegram:  "#/components/schemas/TelegramNotificationEndpoint"
		}
	}
}
