package commonpaths

checks: {
	get: {
		operationId: "GetChecks"
		tags: [
			"Checks",
		]
		summary: "List all checks"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			$ref: "../parameters/Offset.yml"
		}, {
			$ref: "../parameters/Limit.yml"
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
				content: "application/json": schema: $ref: "../schemas/Checks.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
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
			content: "application/json": schema: $ref: "../schemas/PostCheck.yml"
		}
		responses: {
			"201": {
				description: "Check created"
				content: "application/json": schema: $ref: "../schemas/Check.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
