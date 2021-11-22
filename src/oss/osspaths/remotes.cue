package osspaths

import (
	"github.com/influxdata/openapi/src/oss/ossschemas"
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

remotes: {
	get: {
		operationId: "GetRemoteConnections"
		tags: [
			"RemoteConnections",
		]
		summary: "List all remote connections"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID."
			required:    true
			schema: type: "string"
		}, {
			in:   "query"
			name: "name"
			schema: type: "string"
		}, {
			in:   "query"
			name: "remoteURL"
			schema: {
				type:   "string"
				format: "uri"
			}
		}]
		responses: {
			"200": {
				description: "List of remote connections"
				content: "application/json": schema: ossschemas.RemoteConnections.#Ref
			}
			"404":   commonresponses.ServerError.#Ref
			default: commonresponses.ServerError.#Ref
		}
	}

	post: {
		operationId: "PostRemoteConnection"
		tags: [
			"RemoteConnections",
		]
		summary: "Register a new remote connection"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "validate"
			description: "If true, validate the remote connection, but don't save it."
			schema: {
				type:    "boolean"
				default: false
			}
		}]
		requestBody: {
			required: true
			content: "application/json": schema: ossschemas.RemoteConnectionCreationRequest.#Ref
		}
		responses: {
			"204": description: "Remote connection validated, but not saved"
			"201": {
				description: "Remote connection saved"
				content: "application/json": schema: ossschemas.RemoteConnection.#Ref
			}
			"400":   commonresponses.ServerError.#Ref
			default: commonresponses.ServerError.#Ref
		}
	}
}
