package commonschemas

LogicalExpression: {
	description: "Represents the rule conditions that collectively evaluate to either true or false"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		operator: type: "string"
		left: Expression.#Ref
		right: Expression.#Ref
	}
}
