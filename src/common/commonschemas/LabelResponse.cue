package commonschemas

LabelResponse: {
	type: "object"
	properties: {
		label: Label.#Ref
		links: Links.#Ref
	}
}
