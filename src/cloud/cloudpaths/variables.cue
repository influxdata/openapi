package cloudpaths

variables: {
	get: {
		operationId: "GetVariables"
		tags: [
			"Variables",
		]
		summary: "List all variables"
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}, {
			in:          "query"
			name:        "org"
			description: "The name of the organization."
			schema: type: "string"
		}, {
			in:          "query"
			name:        "orgID"
			description: "The organization ID."
			schema: type: "string"
		}]
		responses: {
			"200": {
				description: "A list of variables for an organization."
				content: "application/json": schema: $ref: "../schemas/Variables.yml"
			}
			"400": {
				description: "Invalid request"
				$ref:        "../../common/responses/ServerError.yml"
			}
			default: {
				description: "Internal server error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
	post: {
		operationId: "PostVariables"
		summary:     "Create a variable"
		tags: [
			"Variables",
		]
		parameters: [{
			$ref: "../../common/parameters/TraceSpan.yml"
		}]
		requestBody: {
			description: "Variable to create"
			required:    true
			content: "application/json": schema: $ref: "../schemas/Variable.yml"
		}
		responses: {
			"201": {
				description: "Variable created"
				content: "application/json": schema: $ref: "../schemas/Variable.yml"
			}
			default: {
				description: "Internal server error"
				$ref:        "../../common/responses/ServerError.yml"
			}
		}
	}
}
