package osspaths

remotes_remoteID: {
	get: {
		operationId: "GetRemoteConnectionByID"
		tags: [
			"RemoteConnections",
		]
		summary: "Retrieve a remote connection"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "remoteID"
			schema: type: "string"
			required: true
		}]
		responses: {
			"200": {
				description: "Remote connection"
				content: "application/json": schema: $ref: "../schemas/RemoteConnection.yml"
			}
			"404": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}

	patch: {
		operationId: "PatchRemoteConnectionByID"
		tags: [
			"RemoteConnections",
		]
		summary: "Update a remote connection"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "remoteID"
			schema: type: "string"
			required: true
		}, {
			in:          "query"
			name:        "validate"
			description: "If true, validate the updated information, but don't save it."
			schema: {
				type:    "boolean"
				default: false
			}
		}]
		requestBody: {
			required: true
			content: "application/json": schema: $ref: "../schemas/RemoteConnectionUpdateRequest.yml"
		}
		responses: {
			"204": description: "Updated connection validated, but not saved"
			"200": {
				description: "Updated information saved"
				content: "application/json": schema: $ref: "../schemas/RemoteConnection.yml"
			}
			"404": $ref: "../../common/responses/ServerError.yml"
			"400": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}

	delete: {
		operationId: "DeleteRemoteConnectionByID"
		tags: [
			"RemoteConnections",
		]
		summary: "Delete a remote connection"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "remoteID"
			schema: type: "string"
			required: true
		}]
		responses: {
			"204": description: "Remote connection info deleted."
			"404": $ref: "../../common/responses/ServerError.yml"
			default: $ref: "../../common/responses/ServerError.yml"
		}
	}
}
