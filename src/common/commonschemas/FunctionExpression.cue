package commonschemas

FunctionExpression: {
	description: "Function expression"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		params: {
			description: "Function parameters"
			type:        "array"
			items: Property.#Ref
		}
		body: Node.#Ref
	}
}
