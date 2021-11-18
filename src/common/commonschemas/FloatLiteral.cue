package commonschemas

FloatLiteral: {
	description: "Represents floating point numbers according to the double representations defined by the IEEE-754-1985"
	type:        "object"
	properties: {
		type: NodeType.#Ref
		value: type: "number"
	}
}
