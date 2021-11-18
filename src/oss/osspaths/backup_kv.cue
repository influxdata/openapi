package osspaths

import "github.com/influxdata/openapi/src/common/commonparameters"

import "github.com/influxdata/openapi/src/common/commonresponses"

backup_kv: get: {
	operationId: "GetBackupKV"
	tags: [
		"Backup",
	]
	summary: "Download snapshot of metadata stored in the server's embedded KV store. Should not be used in versions greater than 2.1.x, as it doesn't include metadata stored in embedded SQL."

	deprecated: true
	parameters: [{
		commonparameters.TraceSpan.#Ref
	}]
	responses: {
		"200": {
			description: "Snapshot of KV metadata"
			content: "application/octet-stream": schema: {
				type:   "string"
				format: "binary"
			}
		}
		default: {
			description: "Unexpected error"
			commonresponses.ServerError.#Ref
		}
	}
}
