package commonpaths

telegrafs_telegrafID_labels: {
	get: {
		operationId: "GetTelegrafsIDLabels"
		tags: [
			"Telegrafs",
		]
		summary: "List all labels for a Telegraf config"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		responses: {
			"200": {
				description: "A list of all labels for a Telegraf config"
				content: "application/json": schema: $ref: "../schemas/LabelsResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	post: {
		operationId: "PostTelegrafsIDLabels"
		tags: [
			"Telegrafs",
		]
		summary: "Add a label to a Telegraf config"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "telegrafID"
			schema: type: "string"
			required:    true
			description: "The Telegraf config ID."
		}]
		requestBody: {
			description: "Label to add"
			required:    true
			content: "application/json": schema: $ref: "../schemas/LabelMapping.yml"
		}
		responses: {
			"201": {
				description: "The label added to the Telegraf config"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
