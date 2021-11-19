package unityschemas

Marketplace: {
	properties: {
		name: {
			description: "full name of the marketplace"
			type:        "string"
			example:     "Google Cloud Marketplace"
		}
		shortName: {
			description: "marketplace acronyms"
			MarketplaceType.#Ref
			example:     "gcm"
		}
		url: {
			description: "link to marketplace"
			type:        "string"
		}
	}
	required: ["name", "shortName", "url"]
}
