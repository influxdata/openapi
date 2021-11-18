package commonschemas

ParenExpression: {
	description: "Represents an expression wrapped in parenthesis"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		expression: Expression.#Ref
	}
}
