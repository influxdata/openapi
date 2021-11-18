package commonpaths

orgs_orgID_secrets_secretID: delete: {
	operationId: "DeleteOrgsIDSecretsID"
	tags: [
		"Secrets",
	]
	summary: "Delete a secret from an organization"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
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
			$ref:        "../responses/ServerError.yml"
		}
	}
}
