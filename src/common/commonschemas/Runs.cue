package commonschemas

Runs: {
	type: "object"
	properties: {
		links: Links.#Ref
		runs: {
			type:  "array"
			items: Run.#Ref
		}
	}
}
