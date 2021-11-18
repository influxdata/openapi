package paths

dbrps_dbrpID: {
	get: {
		operationId: "GetDBRPsID"
		tags: [
			"DBRPs",
		]
		summary: "Retrieve a database retention policy mapping"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID of the mapping"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name of the mapping"
			schema: type: "string"
		}, {
			in:   "path"
			name: "dbrpID"
			schema: type: "string"
			required:    true
			description: "The database retention policy mapping ID"
		}]
		responses: {
			"200": {
				description: "The database retention policy requested"
				content: "application/json": schema: $ref: "../schemas/DBRPGet.yml"
			}
			"400": {
				description: "if any of the IDs passed is invalid"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	patch: {
		operationId: "PatchDBRPID"
		tags: [
			"DBRPs",
		]
		summary: "Update a database retention policy mapping"
		requestBody: {
			description: "Database retention policy update to apply"
			required:    true
			content: "application/json": schema: $ref: "../schemas/DBRPUpdate.yml"
		}
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID of the mapping"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name of the mapping"
			schema: type: "string"
		}, {
			in:   "path"
			name: "dbrpID"
			schema: type: "string"
			required:    true
			description: "The database retention policy mapping."
		}]
		responses: {
			"200": {
				description: "An updated mapping"
				content: "application/json": schema: $ref: "../schemas/DBRPGet.yml"
			}
			"404": {
				description: "The mapping was not found"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			"400": {
				description: "if any of the IDs passed is invalid"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
	delete: {
		operationId: "DeleteDBRPID"
		tags: [
			"DBRPs",
		]
		summary: "Delete a database retention policy"
		parameters: [{
			$ref: "../parameters/TraceSpan.yml"
		}, {
			in:          "query"
			name:        "orgID"
			description: "Specifies the organization ID of the mapping"
			schema: type: "string"
		}, {
			in:          "query"
			name:        "org"
			description: "Specifies the organization name of the mapping"
			schema: type: "string"
		}, {
			in:   "path"
			name: "dbrpID"
			schema: type: "string"
			required:    true
			description: "The database retention policy mapping"
		}]
		responses: {
			"204": description: "Delete has been accepted"
			"400": {
				description: "if any of the IDs passed is invalid"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
			default: {
				description: "Unexpected error"
				content: "application/json": schema: $ref: "../schemas/Error.yml"
			}
		}
	}
}
