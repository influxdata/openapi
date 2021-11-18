package commonschemas

CellWithViewProperties: {
	type: "object"
	allOf: [{
		Cell.#Ref
	}, {
		type: "object"
		properties: {
			name: type: "string"
			properties: ViewProperties.#Ref
		}
	}]
}
