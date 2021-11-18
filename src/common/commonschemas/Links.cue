package commonschemas

Links: {
	type: "object"
	properties: {
		next: Link.#Ref
		self: Link.#Ref
		prev: Link.#Ref
	}
	required: ["self"]
}
