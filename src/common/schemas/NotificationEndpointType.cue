package schemas

NotificationEndpointType: {
	type: "string"
	enum: ["slack", "pagerduty", "http", "telegram"]
}
