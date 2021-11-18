package osspaths

remotes_remoteID_validate: post: {
	operationId: "PostValidateRemoteConnectionByID"
	tags: [
		"RemoteConnections",
	]
	summary: "Validate a remote connection"
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}, {
		in:   "path"
		name: "remoteID"
		schema: type: "string"
		required: true
	}]
	responses: {
		"204": description: "Remote connection is valid"
		"400": {
			description: "Remote connection failed validation"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: $ref: "../../common/responses/ServerError.yml"
	}
}
