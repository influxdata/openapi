package commonschemas

StringLiteral: {
	description: "Expressions begin and end with double quote marks"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		value: type: "string"
	}
}
