package commonschemas

BinaryExpression: {
	description: "uses binary operators to act on two operands in an expression"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		operator: type: "string"
		left:  Expression.#Ref
		right: Expression.#Ref
	}
}
