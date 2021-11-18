package commonschemas

IndexExpression: {
	description: "Represents indexing into an array"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		array: Expression.#Ref
		index: Expression.#Ref
	}
}
