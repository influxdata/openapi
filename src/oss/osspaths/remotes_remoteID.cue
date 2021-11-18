package osspaths

import "github.com/influxdata/openapi/src/oss/ossschemas"

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

remotes_remoteID: {
	get: {
		operationId: "GetRemoteConnectionByID"
		tags: [
			"RemoteConnections",
		]
		summary: "Retrieve a remote connection"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "remoteID"
			schema: type: "string"
			required: true
		}]
		responses: {
			"200": {
				description: "Remote connection"
				content: "application/json": schema: ossschemas.RemoteConnection.#Ref
			}
			"404": commonresponses.ServerError.#Ref
			default: commonresponses.ServerError.#Ref
		}
	}

	patch: {
		operationId: "PatchRemoteConnectionByID"
		tags: [
			"RemoteConnections",
		]
		summary: "Update a remote connection"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "remoteID"
			schema: type: "string"
			required: true
		}, {
			in:          "query"
			name:        "validate"
			description: "If true, validate the updated information, but don't save it."
			schema: {
				type:    "boolean"
				default: false
			}
		}]
		requestBody: {
			required: true
			content: "application/json": schema: ossschemas.RemoteConnectionUpdateRequest.#Ref
		}
		responses: {
			"204": description: "Updated connection validated, but not saved"
			"200": {
				description: "Updated information saved"
				content: "application/json": schema: ossschemas.RemoteConnection.#Ref
			}
			"404": commonresponses.ServerError.#Ref
			"400": commonresponses.ServerError.#Ref
			default: commonresponses.ServerError.#Ref
		}
	}

	delete: {
		operationId: "DeleteRemoteConnectionByID"
		tags: [
			"RemoteConnections",
		]
		summary: "Delete a remote connection"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:   "path"
			name: "remoteID"
			schema: type: "string"
			required: true
		}]
		responses: {
			"204": description: "Remote connection info deleted."
			"404": commonresponses.ServerError.#Ref
			default: commonresponses.ServerError.#Ref
		}
	}
}
