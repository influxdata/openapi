package commonschemas

File: {
	description: "Represents a source from a single file"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		name: {
			description: "The name of the file."
			type:        "string"
		}
		package: PackageClause.#Ref
		imports: {
			description: "A list of package imports"
			type:        "array"
			items: ImportDeclaration.#Ref
		}
		body: {
			description: "List of Flux statements"
			type:        "array"
			items: Statement.#Ref
		}
	}
}
