package paths

stacks_stack_id: {
	get: {
		operationId: "ReadStack"
		tags: [
			"Templates",
		]
		summary: "Retrieve a stack"
		parameters: [{
			in:       "path"
			name:     "stack_id"
			required: true
			schema: type: "string"
			description: "The identifier of the stack."
		}]
		responses: {
			"200": {
				description: "Returns the stack."
				content: "application/json": schema: $ref: "../schemas/Stack.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	patch: {
		operationId: "UpdateStack"
		tags: [
			"Templates",
		]
		summary: "Update a stack"
		parameters: [{
			in:       "path"
			name:     "stack_id"
			required: true
			schema: type: "string"
			description: "The identifier of the stack."
		}]
		requestBody: {
			description: "The stack to update."
			required:    true
			content: "application/json": schema: {
				type:  "object"
				title: "PatchStackRequest"
				properties: {
					name: {
						type:     "string"
						nullable: true
					}
					description: {
						type:     "string"
						nullable: true
					}
					templateURLs: {
						type: "array"
						items: type: "string"
						nullable: true
					}
					additionalResources: {
						type: "array"
						items: {
							type: "object"
							properties: {
								resourceID: type: "string"
								kind: type: "string"
								templateMetaName: type: "string"
							}
							required: ["kind", "resourceID"]
						}
					}
				}
			}
		}
		responses: {
			"200": {
				description: "Returns the updated stack."
				content: "application/json": schema: $ref: "../schemas/Stack.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteStack"
		tags: [
			"Templates",
		]
		summary: "Delete a stack and associated resources"
		parameters: [{
			in:       "path"
			name:     "stack_id"
			required: true
			schema: type: "string"
			description: "The identifier of the stack."
		}, {
			in:       "query"
			name:     "orgID"
			required: true
			schema: type: "string"
			description: "The identifier of the organization."
		}]
		responses: {
			"204": description: "The stack and its associated resources were deleted."
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
