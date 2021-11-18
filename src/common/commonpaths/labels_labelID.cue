package commonpaths

labels_labelID: {
	get: {
		operationId: "GetLabelsID"
		tags: [
			"Labels",
		]
		summary: "Retrieve a label"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "labelID"
			schema: type: "string"
			required:    true
			description: "The ID of the label to update."
		}]
		responses: {
			"200": {
				description: "A label"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	patch: {
		operationId: "PatchLabelsID"
		tags: [
			"Labels",
		]
		summary: "Update a label"
		requestBody: {
			description: "Label update"
			required:    true
			content: "application/json": schema: $ref: "../schemas/LabelUpdate.yml"
		}
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "labelID"
			schema: type: "string"
			required:    true
			description: "The ID of the label to update."
		}]
		responses: {
			"200": {
				description: "Updated label"
				content: "application/json": schema: $ref: "../schemas/LabelResponse.yml"
			}
			"404": {
				description: "Label not found"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteLabelsID"
		tags: [
			"Labels",
		]
		summary: "Delete a label"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "labelID"
			schema: type: "string"
			required:    true
			description: "The ID of the label to delete."
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"404": {
				description: "Label not found"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
