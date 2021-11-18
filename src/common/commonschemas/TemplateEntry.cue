package commonschemas

TemplateEntry: {
	type: "object"
	properties: {
		apiVersion: type: "string"
		kind: TemplateKind.#Ref
		meta: {
			type: "object"
			properties: name: type: "string"
		}
		spec: type: "object"
	}
}
