package commonschemas

Package: {
	description: "Represents a complete package source tree."
	type:        "object"
	properties: {
		type: NodeType.#Ref
		path: {
			description: "Package import path"
			type:        "string"
		}
		package: {
			description: "Package name"
			type:        "string"
		}
		files: {
			description: "Package files"
			type:        "array"
			items:       File.#Ref
		}
	}
}
