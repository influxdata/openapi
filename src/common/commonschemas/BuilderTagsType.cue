package commonschemas

BuilderTagsType: {
	type: "object"
	properties: {
		key: type: "string"
		values: {
			type: "array"
			items: type: "string"
		}
		aggregateFunctionType: BuilderAggregateFunctionType.#Ref
	}
}
