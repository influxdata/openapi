package notebooksdpaths

import (
	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"
	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdrequestBodies"
	"github.com/influxdata/openapi/src/common/commonresponses"
)
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
				content: "application/json": schema: notebooksdschemas.Notebooks.#Ref
			}
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	post: {
		summary:     "creates a Notebook"
		operationId: "createNotebook"
		tags: [
			"Notebooks",
		]
		requestBody: notebooksdrequestBodies.NotebookParams.#Ref
		responses: {
			"200": {
				description: "Notebook created"
				content: "application/json": schema: notebooksdschemas.Notebook.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
