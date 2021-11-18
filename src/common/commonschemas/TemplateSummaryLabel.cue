package commonschemas

TemplateSummaryLabel: {
	type: "object"
	properties: {
		id: type: "string"
		orgID: type: "string"
		kind: TemplateKind.#Ref
		templateMetaName: type: "string"
		name: type: "string"
		properties: {
			type: "object"
			properties: {
				color: type: "string"
				description: type: "string"
			}
		}
		envReferences: TemplateEnvReferences.#Ref
	}
}
