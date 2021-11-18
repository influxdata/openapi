package commonschemas

LabelsResponse: {
	type: "object"
	properties: {
		labels: Labels.#Ref
		links: Links.#Ref
	}
}
