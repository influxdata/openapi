package cloudpaths

orgs_orgID_limits: {
	get: {
		tags: [
			"Limits",
		]
		summary: "Retrieve limits for an organization"
		parameters: [{
			in:          "path"
			name:        "orgID"
			description: "The identifier of the organization."
			required:    true
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A limit"
				content: "application/json": schema: $ref: "../schemas/Limit.yml"
			}
			default: {
				description: "unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	put: {
		tags: [
			"Limits",
		]
		summary: "Create or update limits for an organization"
		parameters: [{
			in:          "path"
			name:        "orgID"
			description: "The identifier of the organization."
			required:    true
			schema: type: "string"
		}]
		requestBody: {
			description: "limit that will be updated"
			required:    true
			content: "application/json": schema: $ref: "../schemas/Limit.yml"
		}
		responses: {
			"200": {
				description: "The updated or created limit"
				content: "application/json": schema: $ref: "../schemas/Limit.yml"
			}
			default: {
				description: "unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
