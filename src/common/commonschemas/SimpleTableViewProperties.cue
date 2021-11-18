package commonschemas

SimpleTableViewProperties: {
	type: "object"
	required: [
		"type",
		"showAll",
		"queries",
		"shape",
		"note",
		"showNoteWhenEmpty",
	]
	properties: {
		type: {
			type: "string"
			enum: ["simple-table"]
		}
		showAll: type: "boolean"
		queries: {
			type: "array"
			items: $ref: "./DashboardQuery.yml"
		}
		shape: {
			type: "string"
			enum: [
				"chronograf-v2",
			]
		}
		note: type: "string"
		showNoteWhenEmpty: {
			description: "If true, will display note when empty"
			type:        "boolean"
		}
	}
}
