package commonschemas

BooleanLiteral: {
	description: "Represents boolean values"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		value: type: "boolean"
	}
}
