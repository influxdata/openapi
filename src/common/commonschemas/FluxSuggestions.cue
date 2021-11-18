package commonschemas

FluxSuggestions: {
	type: "object"
	properties: funcs: {
		type: "array"
		items: FluxSuggestion.#Ref
	}
}
