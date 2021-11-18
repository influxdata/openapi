package osspaths

legacy_authorizations_authID: {
	get: {
		operationId: "GetLegacyAuthorizationsID"
		tags: [
			"Legacy Authorizations",
		]
		summary: "Retrieve a legacy authorization"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "authID"
			schema: type: "string"
			required:    true
			description: "The ID of the legacy authorization to get."
		}]
		responses: {
			"200": {
				description: "Legacy authorization details"
				content: "application/json": schema: $ref: "../../common/schemas/Authorization.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	patch: {
		operationId: "PatchLegacyAuthorizationsID"
		tags: [
			"Legacy Authorizations",
		]
		summary: "Update a legacy authorization to be active or inactive"
		requestBody: {
			description: "Legacy authorization to update"
			required:    true
			content: "application/json": schema: $ref: "../../common/schemas/AuthorizationUpdateRequest.yml"
		}
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "authID"
			schema: type: "string"
			required:    true
			description: "The ID of the legacy authorization to update."
		}]
		responses: {
			"200": {
				description: "The active or inactive legacy authorization"
				content: "application/json": schema: $ref: "../../common/schemas/Authorization.yml"
			}
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteLegacyAuthorizationsID"
		tags: [
			"Legacy Authorizations",
		]
		summary: "Delete a legacy authorization"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:   "path"
			name: "authID"
			schema: type: "string"
			required:    true
			description: "The ID of the legacy authorization to delete."
		}]
		responses: {
			"204": description: "Legacy authorization deleted"
			default: {
				description: "Unexpected error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
