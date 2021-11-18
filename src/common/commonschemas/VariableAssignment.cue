package commonschemas

VariableAssignment: {
	description: "Represents the declaration of a variable"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		id: Identifier.#Ref
		init: Expression.#Ref
	}
}
