package annotationdpaths

import (
	"github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

stream: {
	put: {
		tags: [
			"Streams",
		]
		operationId: "updateStream"
		summary:     "Update stream"
		parameters: [{
			in:          "path"
			name:        "streamID"
			description: "stream to update"
			required:    true
			schema: type: "string"
		}]
		requestBody: {
			description: "Stream to update"
			content: "application/json": schema: annotationdschemas.Stream.#Ref
		}
		responses: {
			"200": {
				description: "Stream as updated"
				content: "application/json": schema: annotationdschemas.ReadStream.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"404": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	delete: {
		tags: [
			"Streams",
		]
		operationId: "deleteStreamByID"
		summary:     "Delete stream by ID"
		parameters: [{
			in:          "path"
			name:        "streamID"
			description: "stream to delete"
			required:    true
			schema: type: "string"
		}]
		responses: {
			"204": commonresponses.NoContent.#Ref
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
}
