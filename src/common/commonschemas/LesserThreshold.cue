package commonschemas

LesserThreshold: allOf: [{
	ThresholdBase.#Ref
}, {
	type: "object"
	required: ["type", "value"]
	properties: {
		type: {
			type: "string"
			enum: ["lesser"]
		}
		value: {
			type:   "number"
			format: "float"
		}
	}
}]
