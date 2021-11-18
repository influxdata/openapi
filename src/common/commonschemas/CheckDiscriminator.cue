package commonschemas

CheckDiscriminator: {
	oneOf: [{
		$ref: "./DeadmanCheck.yml"
	}, {
		$ref: "./ThresholdCheck.yml"
	}, {
		$ref: "./CustomCheck.yml"
	}]
	discriminator: {
		propertyName: "type"
		mapping: {
			deadman:   "#/components/schemas/DeadmanCheck"
			threshold: "#/components/schemas/ThresholdCheck"
			custom:    "#/components/schemas/CustomCheck"
		}
	}
}
