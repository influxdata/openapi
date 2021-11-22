package notebooksdpaths

import (
	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"

	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdrequestBodies"

	"github.com/influxdata/openapi/src/common/commonresponses"

)
notebooks_id: {
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
				content: "application/json": schema: notebooksdschemas.Notebook.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
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
			"204": commonresponses.NoContent.#Ref
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"404": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
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
		requestBody: notebooksdrequestBodies.NotebookParams.#Ref
		responses: {
			"200": {
				description: "returns the Notebook record"
				content: "application/json": schema: notebooksdschemas.Notebook.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
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
		requestBody: notebooksdrequestBodies.NotebookParams.#Ref
		responses: {
			"200": {
				description: "returns the Notebook record"
				content: "application/json": schema: notebooksdschemas.Notebook.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
