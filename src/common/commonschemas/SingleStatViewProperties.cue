package commonschemas

SingleStatViewProperties: {
	type: "object"
	required: [
		"type",
		"queries",
		"colors",
		"shape",
		"note",
		"showNoteWhenEmpty",
		"prefix",
		"tickPrefix",
		"suffix",
		"tickSuffix",
		"decimalPlaces",
	]
	properties: {
		type: {
			type: "string"
			enum: ["single-stat"]
		}
		queries: {
			type: "array"
			items: DashboardQuery.#Ref
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items: DashboardColor.#Ref
		}
		shape: {
			type: "string"
			enum: ["chronograf-v2"]
		}
		note: type: "string"
		showNoteWhenEmpty: {
			description: "If true, will display note when empty"
			type:        "boolean"
		}
		prefix: type: "string"
		tickPrefix: type: "string"
		suffix: type: "string"
		tickSuffix: type: "string"
		staticLegend: StaticLegend.#Ref
		decimalPlaces: DecimalPlaces.#Ref
	}
}
