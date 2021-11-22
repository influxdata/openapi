package old

"svc-pinneditemsd": {
	openapi: "3.0.0"
	info: {
		title:   "pinneditemsd"
		version: "1.0.0"
	}
	servers: [{
		url: "/api/v2private"
	}]
	paths: {
		"/pinned": {
			get: {
				summary:     "get all pinned items"
				operationId: "getPinnedItems"
				tags: [
					"PinnedItems",
				]
				responses: {
					"200": {
						description: "returns all pinned items for a given user"
						content: "application/json": schema: $ref: "#/components/schemas/PinnedItemArray"
					}
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
			post: {
				summary:     "creates a Pinned Item"
				operationId: "createPinnedItem"
				tags: [
					"PinnedItems",
				]
				requestBody: {
					$ref:     "#/components/requestBodies/PinnedItemParams"
					required: true
				}
				responses: {
					"200": {
						description: "Pinned item record created"
						content: "application/json": schema: $ref: "#/components/schemas/PinnedItem"
					}
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
		}
		"/pinned/{id}": {
			delete: {
				summary:     "deletes a single Pinned Item by its ID"
				operationId: "deletePinnedItem"
				tags: [
					"PinnedItems",
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
				summary:     "update a single Pinned Item by its ID"
				operationId: "updatePinnedItem"
				tags: [
					"PinnedItems",
				]
				parameters: [{
					name: "id"
					in:   "path"
					schema: type: "string"
					required: true
				}]
				requestBody: $ref: "#/components/requestBodies/PinnedItemParams"
				responses: {
					"200": $ref: "#/components/responses/NoContent"
					"400": $ref: "#/components/responses/ServerError"
					"401": $ref: "#/components/responses/ServerError"
					"500": $ref: "#/components/responses/ServerError"
				}
			}
		}
	}
	components: {
		requestBodies: PinnedItemParams: {
			description: "Pinned Item record"
			required:    false
			// HERE
			content: "application/json": schema: $ref: "#/components/schemas/PinnedItem"
		}
		schemas: {
			PinnedItem: properties: {
				id: type:     "string"
				orgID: type:  "string"
				type: type:   "string"
				userID: type: "string"
				createdAt: {
					type:   "string"
					format: "date-time"
				}
				updatedAt: {
					type:   "string"
					format: "date-time"
				}
				metadata: type: "object"
			}
			PinnedItemArray: {
				type: "array"
				items: $ref: "#/components/schemas/PinnedItem"
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
