package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonschemas"

)

templates_apply: post: {
	operationId: "ApplyTemplate"
	tags: [
		"Templates",
	]
	summary:     "Apply or dry-run a template"
	description: "Applies or performs a dry-run of template in an organization."
	requestBody: {
		required: true
		content: {
			"application/json": schema:      commonschemas.TemplateApply.#Ref
			"application/x-jsonnet": schema: commonschemas.TemplateApply.#Ref
			"text/yml": schema:              commonschemas.TemplateApply.#Ref
		}
	}
	responses: {
		"200": {
			description: """
				Success. The package dry-run succeeded. No new resources were created. Returns a diff and summary of the dry-run. The diff and summary won't contain IDs for resources that didn't exist at the time of the dry-run.

				"""

			content: "application/json": schema: commonschemas.TemplateSummary.#Ref
		}
		"201": {
			description: """
				Success. The package applied successfully. Returns a diff and summary of the run. The summary contains newly created resources. The diff compares the initial state to the state after the package applied. This corresponds to `\"dryRun\": true`.

				"""

			content: "application/json": schema: commonschemas.TemplateSummary.#Ref
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
