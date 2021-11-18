package commonschemas

PackageClause: {
	description: "Defines a package identifier"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		name: Identifier.#Ref
	}
}
