package paths

api_share_id: get: {
	summary:     "get a notebook by an accessID"
	operationId: "getSharedNotebook"
	tags: [
		"Unauthenticated",
	]
	parameters: [{
		name: "id"
		in:   "path"
		schema: type: "string"
		required: true
	}]
	responses: {
		"200": {
			description: "returns the shared Notebook record"
			content: "application/json": schema: $ref: "../schemas/Notebook.yml"
		}
		"400": $ref: "../../../common/responses/ServerError.yml"
		"401": $ref: "../../../common/responses/ServerError.yml"
		"500": $ref: "../../../common/responses/ServerError.yml"
	}
}
