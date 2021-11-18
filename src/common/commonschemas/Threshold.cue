package commonschemas

Threshold: {
	oneOf: [{
		$ref: "./GreaterThreshold.yml"
	}, {
		$ref: "./LesserThreshold.yml"
	}, {
		$ref: "./RangeThreshold.yml"
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
