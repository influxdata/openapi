package commonschemas

DashboardQuery: {
	type: "object"
	properties: {
		text: {
			type:        "string"
			description: "The text of the Flux query."
		}
		editMode: QueryEditMode.#Ref
		name: type: "string"
		builderConfig: BuilderConfig.#Ref
	}
}
