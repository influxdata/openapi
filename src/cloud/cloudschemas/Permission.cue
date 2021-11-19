package cloudschemas

Permission: {
	required: ["action", "resource"]
	properties: {
		action: {
			type: "string"
			enum: [
				"read",
				"write",
			]
		}
		resource: Resource.#Ref
	}
}
