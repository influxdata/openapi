package commonschemas

MemberAssignment: {
	description: "Object property assignment"
	type:        "object"
	properties: {
		type:   NodeType.#Ref
		member: MemberExpression.#Ref
		init:   Expression.#Ref
	}
}
