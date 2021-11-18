package commonschemas

Threshold: {
	oneOf: [{
		GreaterThreshold.#Ref
	}, {
		LesserThreshold.#Ref
	}, {
		RangeThreshold.#Ref
	}]
	discriminator: {
		propertyName: "type"
		mapping: {
			greater: "#/components/schemas/GreaterThreshold"
			lesser:  "#/components/schemas/LesserThreshold"
			range:   "#/components/schemas/RangeThreshold"
		}
	}
}
