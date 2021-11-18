package commonpaths

sources: {
	post: {
		operationId: "PostSources"
		tags: [
			"Sources",
		]
		summary: "Create a source"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "Source to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/Source.yml"
		}
		responses: {
			"201": {
				description: "Created Source"
				content: "application/json": schema: $ref: "../schemas/Source.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	get: {
		operationId: "GetSources"
		tags: [
			"Sources",
		]
		summary: "List all sources"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of sources"
				content: "application/json": schema: $ref: "../schemas/Sources.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
