package commonschemas

Property: {
	description: "The value associated with a key"
	type:        "object"
	properties: {
		type:  NodeType.#Ref
		key:   PropertyKey.#Ref
		value: Expression.#Ref
	}
}
