package commonschemas

ReturnStatement: {
	description: "Defines an expression to return"
	type:        "object"
	properties: {
		type:     NodeType.#Ref
		argument: Expression.#Ref
	}
}
