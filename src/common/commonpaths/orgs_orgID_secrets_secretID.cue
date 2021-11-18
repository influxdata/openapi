package commonpaths

import "github.com/influxdata/openapi/src/common/commonresponses"

import "github.com/influxdata/openapi/src/common/commonparameters"


orgs_orgID_secrets_secretID: delete: {
	operationId: "DeleteOrgsIDSecretsID"
	tags: [
		"Secrets",
	]
	summary: "Delete a secret from an organization"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "orgID"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}, {
		in:   "path"
		name: "secretID"
		schema: type: "string"
		required:    true
		description: "The secret ID."
	}]
	responses: {
		"204": description: "Keys successfully deleted"
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
