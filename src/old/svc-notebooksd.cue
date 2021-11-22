package old

"svc-notebooksd": {
	openapi: "3.0.0"
	info: {
		title:   "notebooksd"
		version: "1.0.0"
	}
	servers: [{
		url: "/api/v2private"
	}]
	paths: {
		"/notebooks": {
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
						content: "application/json": schema: $ref: "#/components/schemas/Notebooks"
					}
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
			post: {
				summary:     "creates a Notebook"
				operationId: "createNotebook"
				tags: [
					"Notebooks",
				]
				requestBody: $ref: "#/components/requestBodies/NotebookParams"
				responses: {
					"200": {
						description: "Notebook created"
						content: "application/json": schema: $ref: "#/components/schemas/Notebook"
					}
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
		}
		"/notebooks/{id}": {
			get: {
				summary:     "get single Notebook by its ID"
				operationId: "getNotebook"
				tags: [
					"Notebooks",
				]
				parameters: [{
					name: "id"
					in:   "path"
					schema: type: "string"
					required: true
				}]
				responses: {
					"200": {
						description: "returns the Notebook record"
						content: "application/json": schema: $ref: "#/components/schemas/Notebook"
					}
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
			delete: {
				summary:     "deletes a single Notebook by its ID"
				operationId: "deleteNotebook"
				tags: [
					"Notebooks",
				]
				parameters: [{
					name: "id"
					in:   "path"
					schema: type: "string"
					required: true
				}]
				responses: {
					"204": $ref: "#/components/responses/NoContent"
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"404": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
			put: {
				summary:     "update a single Notebook by its ID"
				operationId: "putNotebook"
				tags: [
					"Notebooks",
				]
				parameters: [{
					name: "id"
					in:   "path"
					schema: type: "string"
					required: true
				}]
				requestBody: $ref: "#/components/requestBodies/NotebookParams"
				responses: {
					"200": {
						description: "returns the Notebook record"
						content: "application/json": schema: $ref: "#/components/schemas/Notebook"
					}
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
			patch: {
				summary:     "update a single Notebook by its ID"
				operationId: "patchNotebook"
				tags: [
					"Notebooks",
				]
				parameters: [{
					name: "id"
					in:   "path"
					schema: type: "string"
					required: true
				}]
				requestBody: $ref: "#/components/requestBodies/NotebookParams"
				responses: {
					"200": {
						description: "returns the Notebook record"
						content: "application/json": schema: $ref: "#/components/schemas/Notebook"
					}
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
		}
		"/notebooks/share": {
			get: {
				summary:     "get all Share records in org"
				operationId: "getAllShares"
				tags: [
					"Share",
				]
				parameters: [{
					name: "orgID"
					in:   "query"
					schema: type: "string"
					required: true
				}, {
					name: "notebookID"
					in:   "query"
					schema: type: "string"
					required: false
				}]
				responses: {
					"200": {
						description: "returns all Share records in org"
						content: "application/json": schema: $ref: "#/components/schemas/Shares"
					}
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
			post: {
				summary:     "creates a Share"
				operationId: "createShare"
				tags: [
					"Share",
				]
				requestBody: $ref: "#/components/requestBodies/ShareParams"
				responses: {
					"200": {
						description: "Share created"
						content: "application/json": schema: $ref: "#/components/schemas/Share"
					}
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
		}
		"/notebooks/share/{id}": {
			delete: {
				summary:     "deletes a single Share by its ID"
				operationId: "deleteShare"
				tags: [
					"Share",
				]
				parameters: [{
					name: "id"
					in:   "path"
					schema: type: "string"
					required: true
				}]
				responses: {
					"204": $ref: "#/components/responses/ServerError"
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"404": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
			put: {
				summary:     "update a single Share by its ID"
				operationId: "putShare"
				tags: [
					"Share",
				]
				parameters: [{
					name: "id"
					in:   "path"
					schema: type: "string"
					required: true
				}]
				requestBody: $ref: "#/components/requestBodies/ShareParams"
				responses: {
					"200": {
						description: "returns the Share record"
						content: "application/json": schema: $ref: "#/components/schemas/Share"
					}
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
		}
		"/api/share/{id}/query/{pipeID}": get: {
			summary:     "run the pipe's query and return the result"
			operationId: "queryPipe"
			tags: [
				"Unauthenticated",
			]
			parameters: [{
				name: "id"
				in:   "path"
				schema: type: "string"
				required: true
			}, {
				name: "pipeID"
				in:   "path"
				schema: type: "string"
				required: true
			}]
			responses: {
				"200": {
					description: "returns result from the pipe's query"
					content: "text/csv": schema: type: "string"
				}
				"400": $ref: "#/components/responses/ServerError"
				"401": $ref: "#/components/responses/ServerError"
				"500": $ref: "#/components/responses/ServerError"
			}
		}
		"/api/share/{id}": get: {
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
					content: "application/json": schema: $ref: "#/components/schemas/Notebook"
				}
				"400": $ref: "#/components/responses/ServerError"
				"401": $ref: "#/components/responses/ServerError"
				"500": $ref: "#/components/responses/ServerError"
			}
		}
	}
	components: {
		requestBodies: {
			NotebookParams: {
				description: "Notebook record"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/NotebookParams"
			}
			ShareParams: {
				description: "Share record"
				required:    true
				content: "application/json": schema: $ref: "#/components/schemas/ShareParams"
			}
		}
		schemas: {
			NotebookParams: properties: {
				name: type:  "string"
				orgID: type: "string"
				spec: type:  "object"
			}
			Notebook: properties: {
				id: type:    "string"
				name: type:  "string"
				orgID: type: "string"
				spec: type:  "object"
				createdAt: {
					type:   "string"
					format: "date-time"
				}
				updatedAt: {
					type:   "string"
					format: "date-time"
				}
			}
			NotebookArray: {
				type: "array"
				items: $ref: "#/components/schemas/Notebook"
			}
			Notebooks: properties: flows: {
				type: "array"
				items: $ref: "#/components/schemas/Notebook"
			}
			ShareParams: properties: {
				notebookID: type: "string"
				orgID: type:      "string"
				token: type:      "string"
				region: type:     "string"
			}
			Share: properties: {
				id: type:         "string"
				orgID: type:      "string"
				notebookID: type: "string"
				accessID: type:   "string"
				token: type:      "object"
				region: type:     "string"
				createdAt: {
					type:   "string"
					format: "date-time"
				}
				updatedAt: {
					type:   "string"
					format: "date-time"
				}
			}
			Shares: {
				type: "array"
				items: $ref: "#/components/schemas/Share"
			}
			Error: {
				properties: {
					code: {
						description: "code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: [
							"internal error",
							"not found",
							"conflict",
							"invalid",
							"unprocessable entity",
							"empty value",
							"unavailable",
							"forbidden",
							"too many requests",
							"unauthorized",
							"method not allowed",
							"request too large",
							"unsupported media type",
						]
					}
					message: {
						readOnly:    true
						description: "message is a human-readable message."
						type:        "string"
					}
					op: {
						readOnly:    true
						description: "op describes the logical code operation during error. Useful for debugging."
						type:        "string"
					}
					err: {
						readOnly:    true
						description: "err is a stack of errors that occurred during processing of the request. Useful for debugging."
						type:        "string"
					}
				}
				required: [
					"code",
					"message",
				]
			}
		}
		responses: {
			NoContent: description: "No content"
			ServerError: {
				description: "Non 2XX error response from server."
				content: "application/json": schema: $ref: "#/components/schemas/Error"
			}
		}
	}
}
