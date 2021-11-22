package notebooksdrequestBodies

import (
	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"
)
ShareParams: {
	description: "Share record"
	required:    true
	content: "application/json": schema: notebooksdschemas.ShareParams.#Ref
}
