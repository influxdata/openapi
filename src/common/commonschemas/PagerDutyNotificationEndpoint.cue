package commonschemas

PagerDutyNotificationEndpoint: {
	type: "object"
	allOf: [{
		NotificationEndpointBase.#Ref
	}, {
		type: "object"
		required: ["routingKey"]
		properties: {
			clientURL: type: "string"
			routingKey: type: "string"
		}
	}]
}
