package commonschemas

ObjectExpression: {
	description: "Allows the declaration of an anonymous object within a declaration"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		properties: {
			description: "Object properties"
			type:        "array"
			items:       Property.#Ref
		}
	}
}
