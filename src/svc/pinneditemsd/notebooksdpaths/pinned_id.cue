package notebooksdpaths

pinned_id: {
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
			"204": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"404": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
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
		requestBody: $ref: "../requestBodies/PinnedItemParams.yml"
		responses: {
			"200": $ref: "../../../common/responses/NoContent.yml"
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
