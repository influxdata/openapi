package commonschemas

BuilderConfig: {
	type: "object"
	properties: {
		buckets: {
			type: "array"
			items: type: "string"
		}
		tags: {
			type: "array"
			items: BuilderTagsType.#Ref
		}
		functions: {
			type: "array"
			items: BuilderFunctionsType.#Ref
		}
		aggregateWindow: {
			type: "object"
			properties: {
				period: type: "string"
				fillValues: type: "boolean"
			}
		}
	}
}
