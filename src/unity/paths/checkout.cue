package paths

checkout: post: {
	operationId: "PostCheckout"
	tags: [
		"Accounts",
	]
	requestBody: {
		description: "Information for Upgrading Account"
		required:    true
		content: "application/json": schema: $ref: "../schemas/CheckoutRequest.yml"
	}
	responses: {
		"201": description: "Created"
		"400": {
			description: "Bad Request"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"401": {
			description: "Unauthorized"
			$ref:        "../../common/responses/ServerError.yml"
		}
		"404": {
			description: "Org/User not found or Beta region"
			$ref:        "../../common/responses/ServerError.yml"
		}
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
