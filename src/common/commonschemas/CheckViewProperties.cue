package commonschemas

CheckViewProperties: {
	type: "object"
	required: [
		"type",
		"shape",
		"checkID",
		"queries",
		"colors",
	]
	properties: {
		type: {
			type: "string"
			enum: ["check"]
		}
		shape: {
			type: "string"
			enum: ["chronograf-v2"]
		}
		checkID: type: "string"
		check: Check.#Ref
		queries: {
			type:  "array"
			items: DashboardQuery.#Ref
		}
		colors: {
			description: "Colors define color encoding of data into a visualization"
			type:        "array"
			items:       DashboardColor.#Ref
		}
		legendColorizeRows: type: "boolean"
		legendHide: type:         "boolean"
		legendOpacity: {
			type:   "number"
			format: "float"
		}
		legendOrientationThreshold: type: "integer"
	}
}
