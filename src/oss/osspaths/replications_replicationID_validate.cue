package paths

replications_replicationID_validate: post: {
	operationId: "PostValidateReplicationByID"
	tags: [
		"Replications",
	]
	summary: "Validate a replication"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "replicationID"
		schema: type: "string"
		required: true
	}]
	responses: {
		"204": description: "Replication is valid"
		"400": {
			description: "Replication failed validation"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: $ref: "../../common/responses/ServerError.yml"
	}
}
