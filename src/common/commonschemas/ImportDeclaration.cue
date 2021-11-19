package commonschemas

ImportDeclaration: {
	description: "Declares a package import"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		as:   Identifier.#Ref
		path: StringLiteral.#Ref
	}
}
