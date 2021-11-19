package commonschemas

CallExpression: {
	description: "Represents a function call"
	type:        "object"
	properties: {
		type:   NodeType.#Ref
		callee: Expression.#Ref
		arguments: {
			description: "Function arguments"
			type:        "array"
			items:       Expression.#Ref
		}
	}
}
