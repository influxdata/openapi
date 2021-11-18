package schemas

TemplateEntry: {
	type: "object"
	properties: {
		apiVersion: type: "string"
		kind: $ref: "./TemplateKind.yml"
		meta: {
			type: "object"
			properties: name: type: "string"
		}
		spec: type: "object"
	}
}
