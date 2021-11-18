package osspaths

backup_kv: get: {
	operationId: "GetBackupKV"
	tags: [
		"Backup",
	]
	summary: "Download snapshot of metadata stored in the server's embedded KV store. Should not be used in versions greater than 2.1.x, as it doesn't include metadata stored in embedded SQL."

	deprecated: true
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
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
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
