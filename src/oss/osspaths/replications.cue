package osspaths

import (
	"github.com/influxdata/openapi/src/oss/ossschemas"
	"github.com/influxdata/openapi/src/common/commonparameters"
	"github.com/influxdata/openapi/src/common/commonresponses"
)

replications: {
	get: {
		operationId: "GetReplications"
		tags: [
			"Replications",
		]
		summary: "List all replications"
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
			name: "remoteID"
			schema: type: "string"
		}, {
			in:   "query"
			name: "localBucketID"
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "List of replications"
				content: "application/json": schema: ossschemas.Replications.#Ref
			}
			"404":   commonresponses.ServerError.#Ref
			default: commonresponses.ServerError.#Ref
		}
	}

	post: {
		operationId: "PostReplication"
		tags: [
			"Replications",
		]
		summary: "Register a new replication"
		parameters: [{
			commonparameters.TraceSpan.#Ref
		}, {
			in:          "query"
			name:        "validate"
			description: "If true, validate the replication, but don't save it."
			schema: {
				type:    "boolean"
				default: false
			}
		}]
		requestBody: {
			required: true
			content: "application/json": schema: ossschemas.ReplicationCreationRequest.#Ref
		}
		responses: {
			"204": description: "Replication validated, but not saved"
			"201": {
				description: "Replication saved"
				content: "application/json": schema: ossschemas.Replication.#Ref
			}
			"400":   commonresponses.ServerError.#Ref
			default: commonresponses.ServerError.#Ref
		}
	}
}
