package notebooksdpaths

import "github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"

import "github.com/influxdata/openapi/src/svc/notebooksd/notebooksdrequestBodies"

import "github.com/influxdata/openapi/src/common/commonresponses"

notebooks_share_id: {
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
			"204": commonresponses.ServerError.#Ref
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"404": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
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
		requestBody: notebooksdrequestBodies.ShareParams.#Ref
		responses: {
			"200": {
				description: "returns the Share record"
				content: "application/json": schema: notebooksdschemas.Share.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
