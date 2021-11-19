package commonschemas

Tasks: {
	type: "object"
	properties: {
		links: {
			readOnly: true
			Links.#Ref
		}
		tasks: {
			type:  "array"
			items: Task.#Ref
		}
	}
}
