package paths

labels: {
	post: {
		operationId: "PostLabels"
		tags: [
			"Labels",
		]
		summary: "Create a label"
		requestBody: {
			description: "Label to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/LabelCreateRequest.yml"
		}
		responses: {
			"201": {
				description: "Added label"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	get: {
		operationId: "GetLabels"
		tags: [
			"Labels",
		]
		summary: "List all labels"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of labels"
				content: "application/json": schema: $ref: "../schemas/LabelsResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
