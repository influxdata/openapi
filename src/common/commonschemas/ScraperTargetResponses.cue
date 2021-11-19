package commonschemas

ScraperTargetResponses: {
	type: "object"
	properties: configurations: {
		type:  "array"
		items: ScraperTargetResponse.#Ref
	}
}
