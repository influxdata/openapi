package commonschemas

ConditionalExpression: {
	description: "Selects one of two expressions, `Alternate` or `Consequent`, depending on a third boolean expression, `Test`"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		test: Expression.#Ref
		alternate: Expression.#Ref
		consequent: Expression.#Ref
	}
}
