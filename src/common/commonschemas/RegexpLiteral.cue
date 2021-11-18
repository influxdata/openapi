package commonschemas

RegexpLiteral: {
	description: "Expressions begin and end with `/` and are regular expressions with syntax accepted by RE2"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		value: type: "string"
	}
}
