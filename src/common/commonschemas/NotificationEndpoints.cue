package commonschemas

NotificationEndpoints: properties: {
	notificationEndpoints: {
		type: "array"
		items: NotificationEndpoint.#Ref
	}
	links: Links.#Ref
}
