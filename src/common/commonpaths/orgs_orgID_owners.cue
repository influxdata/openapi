package commonpaths

orgs_orgID_owners: {
	get: {
		operationId: "GetOrgsIDOwners"
		tags: [
			"Organizations",
		]
		summary: "List all owners of an organization"
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
				description: "A list of organization owners"
				content: "application/json": schema: $ref: "../schemas/ResourceOwners.yml"
			}
			"404": {
				description: "Organization not found"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostOrgsIDOwners"
		tags: [
			"Organizations",
		]
		summary: "Add an owner to an organization"
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
			description: "User to add as owner"
			required:    true
			content: "application/json": schema: $ref: "../schemas/AddResourceMemberRequestBody.yml"
		}
		responses: {
			"201": {
				description: "Organization owner added"
				content: "application/json": schema: $ref: "../schemas/ResourceOwner.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
