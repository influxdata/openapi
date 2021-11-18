package commonschemas

Sources: {
	type: "object"
	properties: {
		links: {
			type: "object"
			properties: self: {
				type:   "string"
				format: "uri"
			}
		}
		sources: {
			type: "array"
			items: Source.#Ref
		}
	}
}
