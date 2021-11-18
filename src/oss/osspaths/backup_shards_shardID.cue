package paths

backup_shards_shardID: get: {
	operationId: "GetBackupShardId"
	tags: [
		"Backup",
	]
	summary: "Download snapshot of all TSM data in a shard"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:          "header"
		name:        "Accept-Encoding"
		description: "Indicates the content encoding (usually a compression algorithm) that the client can understand."
		schema: {
			type:        "string"
			description: "The content coding.  Use `gzip` for compressed data or `identity` for unmodified, uncompressed data."
			default:     "identity"
			enum: [
				"gzip",
				"identity",
			]
		}
	}, {
		in:   "path"
		name: "shardID"
		schema: {
			type:   "integer"
			format: "int64"
		}
		required:    true
		description: "The shard ID."
	}, {
		in:          "query"
		name:        "since"
		description: "Earliest time to include in the snapshot. RFC3339 format."
		schema: {
			type:   "string"
			format: "date-time"
		}
	}]
	responses: {
		"200": {
			description: "TSM snapshot."
			headers: "Content-Encoding": {
				description: "Lists any encodings (usually compression algorithms) that have been applied to the response payload."
				schema: {
					type: "string"
					description: """
						The content coding: `gzip` for compressed data or `identity` for unmodified, uncompressed data.

						"""

					default: "identity"
					enum: [
						"gzip",
						"identity",
					]
				}
			}
			content: "application/octet-stream": schema: {
				type:   "string"
				format: "binary"
			}
		}
		"404": {
			description: "Shard not found."
			content: "application/json": schema: $ref: "../../common/schemas/Error.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
