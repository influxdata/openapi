package commonpaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonschemas"

orgs_orgID_secrets_delete: post: {
	deprecated:  true
	operationId: "PostOrgsIDSecrets"
	tags: [
		"Secrets",
	]
	summary: "Delete secrets from an organization"
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "path"
		name: "orgID"
		schema: type: "string"
		required:    true
		description: "The organization ID."
	}]
	requestBody: {
		description: "Secret key to delete"
		required:    true
		content: "application/json": schema: commonschemas.SecretKeys.#Ref
	}
	responses: {
		"204": description: "Keys successfully patched"
		default: {
			description: "Unexpected error"
			content: "application/json": schema: commonschemas.Error.#Ref
		}
	}
}
