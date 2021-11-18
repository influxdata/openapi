package commonschemas

GreaterThreshold: allOf: [{
	ThresholdBase.#Ref
}, {
	type: "object"
	required: ["type", "value"]
	properties: {
		type: {
			type: "string"
			enum: ["greater"]
		}
		value: {
			type:   "number"
			format: "float"
		}
	}
}]
