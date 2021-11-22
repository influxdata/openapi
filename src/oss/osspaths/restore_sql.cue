package osspaths

import (
	"github.com/influxdata/openapi/src/common/commonparameters"

	"github.com/influxdata/openapi/src/common/commonresponses"

)

restore_sql: post: {
	operationId: "PostRestoreSQL"
	tags: [
		"Restore",
	]
	summary: "Overwrite the embedded SQL store on the server with a backed-up snapshot."
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}, {
		in:   "header"
		name: "Content-Encoding"
		description: """
			The value tells InfluxDB what compression is applied to the line protocol in the request payload.
			To make an API request with a GZIP payload, send `Content-Encoding: gzip` as a request header.

			"""

		schema: {
			type:        "string"
			description: "Specifies that the line protocol in the body is encoded with gzip or not encoded with identity."
			default:     "identity"
			enum: [
				"gzip",
				"identity",
			]
		}
	}, {
		in:   "header"
		name: "Content-Type"
		schema: {
			type:    "string"
			default: "application/octet-stream"
			enum: [
				"application/octet-stream",
			]
		}
	}]
	requestBody: {
		description: "Full SQL snapshot."
		required:    true
		content: {
			// NOTE: Use text-plain here to work around https://github.com/influxdata/oats/issues/16.
			"text/plain": {
				schema: {
					type:   "string"
					format: "binary"
				}
			}
		}
	}
	responses: {
		"204": description: "SQL store successfully overwritten."
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
