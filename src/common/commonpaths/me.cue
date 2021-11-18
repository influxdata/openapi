package commonpaths

me: get: {
	operationId: "GetMe"
	tags: [
		"Users",
	]
	summary: "Retrieve the currently authenticated user"
	parameters: [{
		$ref: "../parameters/TraceSpan.yml"
	}]
	responses: {
		"200": {
			description: "The currently authenticated user."
			content: "application/json": schema: $ref: "../schemas/UserResponse.yml"
		}
		default: {
			description: "Unexpected error"
			content: "application/json": schema: $ref: "../schemas/Error.yml"
		}
	}
}
