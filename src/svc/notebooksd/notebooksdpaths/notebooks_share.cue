package notebooksdpaths

import (
	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdschemas"

	"github.com/influxdata/openapi/src/svc/notebooksd/notebooksdrequestBodies"

	"github.com/influxdata/openapi/src/common/commonresponses"

)
notebooks_share: {
	get: {
		summary:     "get all Share records in org"
		operationId: "getAllShares"
		tags: [
			"Share",
		]
		parameters: [{
			name: "orgID"
			in:   "query"
			schema: type: "string"
			required: true
		}, {
			name: "notebookID"
			in:   "query"
			schema: type: "string"
			required: false
		}]
		responses: {
			"200": {
				description: "returns all Share records in org"
				content: "application/json": schema: notebooksdschemas.Shares.#Ref
			}
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	post: {
		summary:     "creates a Share"
		operationId: "createShare"
		tags: [
			"Share",
		]
		requestBody: notebooksdrequestBodies.ShareParams.#Ref
		responses: {
			"200": {
				description: "Share created"
				content: "application/json": schema: notebooksdschemas.Share.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
