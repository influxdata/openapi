package schemas

ScraperTargetResponses: {
	type: "object"
	properties: configurations: {
		type: "array"
		items: $ref: "./ScraperTargetResponse.yml"
	}
}
