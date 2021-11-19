package quartzpaths

org: {
	get: {
		operationId: "GetOrgsID"
		tags: [
			"Organizations",
		]
		summary: "Retrieve a single organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"200": {
				description: "The found organization"
				content: "application/json": schema: $ref: "../schemas/Organization.yml"
			}
			"401": {
				description: "Unauthorized bearer token"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"404": {
				description: "Organization not found"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteOrgsID"
		tags: [
			"Organizations",
		]
		summary: "Delete a single organization"
		parameters: [{
			in:   "path"
			name: "orgID"
			schema: type: "string"
			required:    true
			description: "The ID of the organization"
		}]
		responses: {
			"204": {
				description: "The organization was deleted"
				content: "application/json": schema: $ref: "../schemas/Organization.yml"
			}
			"401": {
				description: "Unauthorized bearer token"
				$ref:        "../../common/responses/ServerError.yml"
			}
			"503": {
				description: "Service Unavailable"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
