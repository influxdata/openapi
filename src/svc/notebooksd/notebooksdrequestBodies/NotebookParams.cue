package notebooksdrequestBodies

import "github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"

NotebookParams: {
	description: "Notebook record"
	required:    true
	content: "application/json": schema: notebooksdschemas.NotebookParams.#Ref
}
