package osspaths

remotes: {
	get: {
		operationId: "GetRemoteConnections"
		tags: [
			"RemoteConnections",
		]
		summary: "List all remote connections"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
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
				content: "application/json": schema: $ref: "../schemas/RemoteConnections.yml"
			}
			"404": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}

	post: {
		operationId: "PostRemoteConnection"
		tags: [
			"RemoteConnections",
		]
		summary: "Register a new remote connection"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
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
			content: "application/json": schema: $ref: "../schemas/RemoteConnectionCreationRequest.yml"
		}
		responses: {
			"204": description: "Remote connection validated, but not saved"
			"201": {
				description: "Remote connection saved"
				content: "application/json": schema: $ref: "../schemas/RemoteConnection.yml"
			}
			"400": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}
}
