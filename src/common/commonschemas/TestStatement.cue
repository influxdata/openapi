package commonschemas

TestStatement: {
	description: "Declares a Flux test case"
	type:        "object"
	properties: {
		type:       NodeType.#Ref
		assignment: VariableAssignment.#Ref
	}
}
