package paths

pinned: {
	get: {
		summary:     "get all pinned items"
		operationId: "getPinnedItems"
		tags: [
			"PinnedItems",
		]
		responses: {
			"200": {
				description: "returns all pinned items for a given user"
				content: "application/json": schema: $ref: "../schemas/pinnedItemArray.yml"
			}
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
	post: {
		summary:     "creates a Pinned Item"
		operationId: "createPinnedItem"
		tags: [
			"PinnedItems",
		]
		requestBody: {
			$ref:     "../requestBodies/PinnedItemParams.yml"
			required: true
		}
		responses: {
			"200": {
				description: "Pinned item record created"
				content: "application/json": schema: $ref: "../schemas/pinnedItem.yml"
			}
			"400": $ref: "../../../common/responses/ServerError.yml"
			"401": $ref: "../../../common/responses/ServerError.yml"
			"500": $ref: "../../../common/responses/ServerError.yml"
		}
	}
}
