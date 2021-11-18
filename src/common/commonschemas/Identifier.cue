package commonschemas

Identifier: {
	description: "A valid Flux identifier"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		name: type: "string"
	}
}
