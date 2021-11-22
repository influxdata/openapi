package notebooksdpaths

import (
	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)
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
			content: "application/json": schema: notebooksdschemas.Notebook.#Ref
		}
		"400": commonresponses.ServerError.#Ref
		"401": commonresponses.ServerError.#Ref
		"500": commonresponses.ServerError.#Ref
	}
}
