package annotationdosspaths

import (
	"github.com/influxdata/openapi/src/svc/annotationd/annotationdschemas"

	"github.com/influxdata/openapi/src/svc/annotationd/annotationdparameters"

	"github.com/influxdata/openapi/src/common/commonresponses"

)

streams: {
	put: {
		tags: [
			"Streams",
		]
		operationId: "createUpdateStream"
		summary:     "Create or update stream"
		parameters: [{
			name: "orgID"
			in:   "query"
			schema: type: "string"
		}]
		requestBody: {
			description: "Stream to create or update"
			content: "application/json": schema: annotationdschemas.Stream.#Ref
		}
		responses: {
			"200": {
				description: "Stream as created/updated"
				content: "application/json": schema: annotationdschemas.ReadStream.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	get: {
		tags: [
			"Streams",
		]
		operationId: "getStreams"
		summary:     "Get streams"
		parameters: [{
			annotationdparameters.StreamListFilter.#Ref
		}, {
			name: "orgID"
			in:   "query"
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "Optionally filtered list of streams"
				content: "application/json": schema: annotationdschemas.StreamList.#Ref
			}
			"400": commonresponses.ServerError.#Ref
			"401": commonresponses.ServerError.#Ref
			"500": commonresponses.ServerError.#Ref
		}
	}
	delete: {
		tags: [
			"Streams",
		]
		operationId: "deleteStream"
		summary:     "Delete stream"
		parameters: [{
			annotationdparameters.StreamDeleteFilter.#Ref
		}, {
			name: "orgID"
			in:   "query"
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
