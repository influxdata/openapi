package paths

notebooks: {
	get: {
		summary:     "get all Notebook records in org"
		operationId: "getAllNotebooks"
		tags: [
			"Notebooks",
		]
		parameters: [{
			name: "orgID"
			in:   "query"
			schema: type: "string"
			required: true
		}]
		responses: {
			"200": {
				description: "returns all Notebook records in org"
				content: "application/json": schema: $ref: "../schemas/Notebooks.yml"
			}
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	post: {
		summary:     "creates a Notebook"
		operationId: "createNotebook"
		tags: [
			"Notebooks",
		]
		requestBody: $ref: "../requestBodies/NotebookParams.yml"
		responses: {
			"200": {
				description: "Notebook created"
				content: "application/json": schema: $ref: "../schemas/Notebook.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
