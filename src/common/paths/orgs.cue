package paths

orgs: {
	get: {
		operationId: "GetOrgs"
		tags: [
			"Organizations",
		]
		summary: "List all organizations"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			$ref: "../parameters/Offset.yml"
		}, {
			$ref: "../parameters/Limit.yml"
		}, {
			$ref: "../parameters/Descending.yml"
		}, {
			in:   "query"
			name: "org"
			schema: type: "string"
			description: "Filter organizations to a specific organization name."
		}, {
			in:   "query"
			name: "orgID"
			schema: type: "string"
			description: "Filter organizations to a specific organization ID."
		}, {
			in:   "query"
			name: "userID"
			schema: type: "string"
			description: "Filter organizations to a specific user ID."
		}]
		responses: {
			"200": {
				description: "A list of organizations"
				content: "application/json": schema: $ref: "../schemas/Organizations.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostOrgs"
		tags: [
			"Organizations",
		]
		summary: "Create an organization"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "Organization to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/PostOrganizationRequest.yml"
		}
		responses: {
			"201": {
				description: "Organization created"
				content: "application/json": schema: $ref: "../schemas/Organization.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
