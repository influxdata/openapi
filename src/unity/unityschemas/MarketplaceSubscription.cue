package unityschemas

MarketplaceSubscription: {
	properties: {
		marketplace: MarketplaceType.#Ref
		status: {
			type: "string"
			enum: [
				"pending",
				"subscribed",
				"unsubscribed",
				"failed",
			]
			description: "status of the marketplace"
		}
		subscriberId: type: "string"
	}
	required: ["marketplace", "status", "subscriberId"]
}
