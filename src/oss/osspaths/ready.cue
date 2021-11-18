package osspaths

ready: get: {
	operationId: "GetReady"
	tags: [
		"Ready",
	]
	summary: "Get the readiness of an instance at startup"
	servers: [{
		url: ""
	}]
	parameters: [{
		$ref: "../../common/parameters/TraceSpan.yml"
	}]
	responses: {
		"200": {
			description: "The instance is ready"
			content: "application/json": schema: $ref: "../../common/schemas/Ready.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
