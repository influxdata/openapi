package commonschemas

ThresholdBase: properties: {
	level: CheckStatusLevel.#Ref
	allValues: {
		description: "If true, only alert if all values meet threshold."
		type:        "boolean"
	}
}
