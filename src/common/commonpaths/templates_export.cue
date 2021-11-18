package commonpaths

import "github.com/influxdata/openapi/src/common/commonschemas"

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
			commonschemas.TemplateExportByID.#Ref
		}, {
			commonschemas.TemplateExportByName.#Ref
		}]
	}
	responses: {
		"200": {
			description: "The template was created successfully. Returns the newly created template."
			content: {
				"application/json": schema: commonschemas.Template.#Ref
				"application/x-yaml": schema: commonschemas.Template.#Ref
			}
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
