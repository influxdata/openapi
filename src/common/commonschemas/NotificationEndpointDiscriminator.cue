package commonschemas

NotificationEndpointDiscriminator: {
	oneOf: [{
		SlackNotificationEndpoint.#Ref
	}, {
		PagerDutyNotificationEndpoint.#Ref
	}, {
		HTTPNotificationEndpoint.#Ref
	}, {
		TelegramNotificationEndpoint.#Ref
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
