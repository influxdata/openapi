package commonschemas

OptionStatement: {
	description: "A single variable declaration"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		assignment: VariableOrMemberAssignment.#Ref
	}
}
