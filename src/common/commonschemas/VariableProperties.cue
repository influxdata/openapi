package commonschemas

VariableProperties: {
	type: "object"
	oneOf: [{
		QueryVariableProperties.#Ref
	}, {
		ConstantVariableProperties.#Ref
	}, {
		MapVariableProperties.#Ref
	}]
}
