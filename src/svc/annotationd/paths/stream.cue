package paths

stream: {
	put: {
		tags: [
			"Streams",
		]
		operationId: "updateStream"
		summary:     "Update stream"
		parameters: [{
			in:          "path"
			name:        "streamID"
			description: "stream to update"
			required:    true
			schema: type: "string"
		}]
		requestBody: {
			description: "Stream to update"
			content: "application/json": schema: $ref: "../schemas/Stream.yml"
		}
		responses: {
			"200": {
				description: "Stream as updated"
				content: "application/json": schema: $ref: "../schemas/ReadStream.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"404": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	delete: {
		tags: [
			"Streams",
		]
		operationId: "deleteStreamByID"
		summary:     "Delete stream by ID"
		parameters: [{
			in:          "path"
			name:        "streamID"
			description: "stream to delete"
			required:    true
			schema: type: "string"
		}]
		responses: {
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
