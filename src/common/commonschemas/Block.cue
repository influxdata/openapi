package commonschemas

Block: {
	description: "A set of statements"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		body: {
			description: "Block body"
			type:        "array"
			items: Statement.#Ref
		}
	}
}
