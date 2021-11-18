package commonschemas

FluxSuggestions: {
	type: "object"
	properties: funcs: {
		type: "array"
		items: $ref: "./FluxSuggestion.yml"
	}
}
