package commonschemas

UnaryExpression: {
	description: "Uses operators to act on a single operand in an expression"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		operator: type: "string"
		argument: Expression.#Ref
	}
}
