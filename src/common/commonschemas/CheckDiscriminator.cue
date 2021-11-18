package commonschemas

CheckDiscriminator: {
	oneOf: [{
		DeadmanCheck.#Ref
	}, {
		ThresholdCheck.#Ref
	}, {
		CustomCheck.#Ref
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
