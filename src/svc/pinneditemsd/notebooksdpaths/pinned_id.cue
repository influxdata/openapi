package notebooksdpaths

import "github.com/influxdata/openapi/src/svc/pinneditemsd/pinneditemsdrequestBodies"

import "github.com/influxdata/openapi/src/common/commonresponses"

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
			"204": commonresponses.NoContent.#Ref
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"404": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
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
		requestBody: pinneditemsdrequestBodies.PinnedItemParams.#Ref
		responses: {
			"200": commonresponses.NoContent.#Ref
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
