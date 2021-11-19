package commonschemas

PipeExpression: {
	description: "Call expression with pipe argument"
	type:        "object"
	properties: {
		type:     NodeType.#Ref
		argument: Expression.#Ref
		call:     CallExpression.#Ref
	}
}
