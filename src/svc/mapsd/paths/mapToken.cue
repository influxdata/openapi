package paths

mapToken: get: {
	operationId: "getMapboxToken"
	responses: {
		"200": {
			description: "A temp token for Mapbox"
			content: "application/json": schema: $ref: "../schemas/Token.yml"
		}
		"401": $ref: "../../../common/responses/ServerError.yml"
		"500": $ref: "../../../common/responses/ServerError.yml"
		default: $ref: "../../../common/responses/ServerError.yml"
	}
}
