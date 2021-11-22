package notebooksdpaths

import (
	"github.com/influxdata/openapi/src/common/commonresponses"

)
api_share_id_query_pipeid: get: {
	summary:     "run the pipe's query and return the result"
	operationId: "queryPipe"
	tags: [
		"Unauthenticated",
	]
	parameters: [{
		name: "id"
		in:   "path"
		schema: type: "string"
		required: true
	}, {
		name: "pipeID"
		in:   "path"
		schema: type: "string"
		required: true
	}]
	responses: {
		"200": {
			description: "returns result from the pipe's query"
			content: "text/csv": schema: type: "string"
		}
		"400": commonresponses.ServerError.#Ref
		"401": commonresponses.ServerError.#Ref
		"500": commonresponses.ServerError.#Ref
	}
}
