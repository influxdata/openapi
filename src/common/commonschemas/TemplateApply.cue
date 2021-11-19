package commonschemas

TemplateApply: {
	type: "object"
	properties: {
		dryRun: type:  "boolean"
		orgID: type:   "string"
		stackID: type: "string"
		template: {
			type: "object"
			properties: {
				contentType: type: "string"
				sources: {
					type: "array"
					items: type: "string"
				}
				contents: Template.#Ref
			}
		}
		templates: {
			type: "array"
			items: {
				type: "object"
				properties: {
					contentType: type: "string"
					sources: {
						type: "array"
						items: type: "string"
					}
					contents: Template.#Ref
				}
			}
		}
		envRefs: {
			type: "object"
			additionalProperties: oneOf: [{
				type: "string"
			}, {
				type: "integer"
			}, {
				type: "number"
			}, {
				type: "boolean"
			}]
		}
		secrets: {
			type: "object"
			additionalProperties: type: "string"
		}
		remotes: {
			type: "array"
			items: {
				type: "object"
				properties: {
					url: type:         "string"
					contentType: type: "string"
				}
				required: ["url"]
			}
		}
		actions: {
			type: "array"
			items: oneOf: [{
				type: "object"
				properties: {
					action: {
						type: "string"
						enum: ["skipKind"]
					}
					properties: {
						type: "object"
						properties: kind: TemplateKind.#Ref
						required: ["kind"]
					}
				}
			}, {
				type: "object"
				properties: {
					action: {
						type: "string"
						enum: ["skipResource"]
					}
					properties: {
						type: "object"
						properties: {
							kind: TemplateKind.#Ref
							resourceTemplateName: type: "string"
						}
						required: ["kind", "resourceTemplateName"]
					}
				}
			}]
		}
	}
}
