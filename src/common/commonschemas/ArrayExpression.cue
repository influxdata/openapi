package commonschemas

ArrayExpression: {
	description: "Used to create and directly specify the elements of an array object"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		elements: {
			description: "Elements of the array"
			type:        "array"
			items:       Expression.#Ref
		}
	}
}
