package commonpaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonschemas"
)

orgs_orgID_secrets: {
	get: {
		operationId: "GetOrgsIDSecrets"
		tags: [
			"Secrets",
		]
		summary: "List all secret keys for an organization"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The organization ID."
		}]
		responses: {
			"200": {
				description: "A list of all secret keys"
				content: "application/json": schema: commonschemas.SecretKeysResponse.#Ref
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
	patch: {
		operationId: "PatchOrgsIDSecrets"
		tags: [
			"Secrets",
		]
		summary: "Update secrets in an organization"
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
			description: "Secret key value pairs to update/add"
			required:    true
			content: "application/json": schema: commonschemas.Secrets.#Ref
		}
		responses: {
			"204": description: "Keys successfully patched"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: commonschemas.Error.#Ref
			}
		}
	}
}
