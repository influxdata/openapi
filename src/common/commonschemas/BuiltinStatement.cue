package commonschemas

BuiltinStatement: {
	description: "Declares a builtin identifier and its type"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		id:   Identifier.#Ref
	}
}
