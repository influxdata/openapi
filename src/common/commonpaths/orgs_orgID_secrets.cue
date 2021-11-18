package commonpaths

orgs_orgID_secrets: {
	get: {
		operationId: "GetOrgsIDSecrets"
		tags: [
			"Secrets",
		]
		summary: "List all secret keys for an organization"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
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
				content: "application/json": schema: $ref: "../schemas/SecretKeysResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
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
			$ref: "../parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/Secrets.yml"
		}
		responses: {
			"204": description: "Keys successfully patched"
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
