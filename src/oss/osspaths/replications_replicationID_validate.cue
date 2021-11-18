package osspaths

import "github.com/influxdata/openapi/src/common/commonresponses"

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
			commonresponses.ServerError.#Ref
		}
		default: commonresponses.ServerError.#Ref
	}
}
