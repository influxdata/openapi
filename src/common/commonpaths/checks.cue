package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

checks: {
	get: {
		operationId: "GetChecks"
		tags: [
			"Checks",
		]
		summary: "List all checks"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			commonparameters.Offset.#Ref
		}, {
			commonparameters.Limit.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			required:    true
			description: "Only show checks that belong to a specific organization ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of checks"
				content: "application/json": schema: commonschemas.Checks.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	post: {
		operationId: "CreateCheck"
		tags: [
			"Checks",
		]
		summary: "Add new check"
		requestBody: {
			description: "Check to create"
			required:    true
			content: "application/json": schema: commonschemas.PostCheck.#Ref
		}
		responses: {
			"201": {
				description: "Check created"
				content: "application/json": schema: commonschemas.Check.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
