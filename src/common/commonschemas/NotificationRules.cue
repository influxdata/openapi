package commonschemas

NotificationRules: properties: {
	notificationRules: {
		type: "array"
		items: NotificationRule.#Ref
	}
	links: Links.#Ref
}
