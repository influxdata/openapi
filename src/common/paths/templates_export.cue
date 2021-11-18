package paths

templates_export: post: {
	operationId: "ExportTemplate"
	tags: [
		"Templates",
	]
	summary: "Export a new template"
	requestBody: {
		description: "Export resources as an InfluxDB template."
		required:    false
		content: "application/json": schema: oneOf: [{
			$ref: "../schemas/TemplateExportByID.yml"
		}, {
			$ref: "../schemas/TemplateExportByName.yml"
		}]
	}
	responses: {
		"200": {
			description: "The template was created successfully. Returns the newly created template."
			content: {
				"application/json": schema: $ref: "../schemas/Template.yml"
				"application/x-yaml": schema: $ref: "../schemas/Template.yml"
			}
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
