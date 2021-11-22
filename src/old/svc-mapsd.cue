package old

"svc-mapsd": {
	openapi: "3.0.0"
	info: {
		title:   "Maps service"
		version: "0.1.0"
	}
	servers: [{
		url: "/api/v2/maps"
	}]
	paths: "/mapToken": get: {
		operationId: "getMapboxToken"
		responses: {
			"200": {
				description: "A temp token for Mapbox"
				content: "application/json": schema: $ref: "#/components/schemas/Token"
			}
			"401": $ref:   "#/components/responses/ServerError"
			"500": $ref:   "#/components/responses/ServerError"
			default: $ref: "#/components/responses/ServerError"
		}
	}
	components: {
		schemas: {
			Token: {
				type: "object"
				properties: token: type: "string"
			}
			Error: {
				properties: {
					code: {
						description: "code is the machine-readable error code."
						readOnly:    true
						type:        "string"
						enum: [
							"internal error",
							"not found",
							"conflict",
							"invalid",
							"unprocessable entity",
							"empty value",
							"unavailable",
							"forbidden",
							"too many requests",
							"unauthorized",
							"method not allowed",
							"request too large",
							"unsupported media type",
						]
					}
					message: {
						readOnly:    true
						description: "message is a human-readable message."
						type:        "string"
					}
					op: {
						readOnly:    true
						description: "op describes the logical code operation during error. Useful for debugging."
						type:        "string"
					}
					err: {
						readOnly:    true
						description: "err is a stack of errors that occurred during processing of the request. Useful for debugging."
						type:        "string"
					}
				}
				required: [
					"code",
					"message",
				]
			}
		}
		responses: ServerError: {
			description: "Non 2XX error response from server."
			content: "application/json": schema: $ref: "#/components/schemas/Error"
		}
	}
}
