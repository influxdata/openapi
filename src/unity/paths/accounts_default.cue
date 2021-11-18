package paths

accounts_default: put: {
	operationId: "PutDefaultAccount"
	tags: [
		"Accounts",
	]
	requestBody: {
		description: "The account to set as the user's default account"
		required:    true
		content: "application/json": schema: $ref: "../schemas/AccountsDefaultRequest.yml"
	}
	responses: {
		"204": description: "default account set"
		default: {
			description: "Unexpected error"
			$ref:        "../../common/responses/ServerError.yml"
		}
	}
}
