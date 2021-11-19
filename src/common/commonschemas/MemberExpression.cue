package commonschemas

MemberExpression: {
	description: "Represents accessing a property of an object"
	type:        "object"
	properties: {
		type:     NodeType.#Ref
		object:   Expression.#Ref
		property: PropertyKey.#Ref
	}
}
