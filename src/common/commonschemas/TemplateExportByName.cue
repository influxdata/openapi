package commonschemas

TemplateExportByName: {
	type: "object"
	properties: {
		stackID: type: "string"
		orgIDs: {
			type: "array"
			items: {
				type: "object"
				properties: {
					orgID: type: "string"
					resourceFilters: {
						type: "object"
						properties: {
							byLabel: {
								type: "array"
								items: type: "string"
							}
							byResourceKind: {
								type: "array"
								items: TemplateKind.#Ref
							}
						}
					}
				}
			}
		}
		resources: {
			type: "array"
			items: {
				type: "object"
				properties: {
					kind: TemplateKind.#Ref
					name: type: "string"
				}
				required: ["name", "kind"]
			}
		}
	}
}
